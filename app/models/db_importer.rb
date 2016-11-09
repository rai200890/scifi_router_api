# frozen_string_literal: true
require 'roo'

class DbImporter
  SHEET_NAME = 'Tabela'

  FIELDS = { name: 'AP ', wan_mac_address: 'MAC / WAN (ETH0)', wlan_mac_address: 'WLAN (ETIQUETA)', campus: 'CAMPUS',
             department: 'DEPARTAMENTO', location: 'LOCAL', switch_name: 'SWITCH', port: 'PORTA', socket: 'TOMADA',
             panel_port: 'P.PANEL', ap_status: 'STATUS', ip: 'IP DOS APS', comments: 'COMENTARIOS', validated: 'VALIDADO',
             syslocation: 'SYSLOCATION', latitude: 'LATITUDE', longitude: 'LONGITUDE', height: 'ALTURA',
             control_region: 'REGIÃO DE CONTROLE SCIFI', ap_model: 'MODELO DO AP' }.freeze

  ASSOCIATIONS = [:campus, :department, :location, :ap_status, :ap_model, :control_region].freeze

  attr_accessor :spreadsheet, :errors

  def initialize(spreadsheet)
    self.spreadsheet = spreadsheet
    self.errors = nil
  end

  def update
    begin
      rows = parse_rows(read_sheet)
      aps_with_errors = create_aps rows
      delete_old_aps rows
      self.errors = "#{aps_with_errors} could not be imported" if aps_with_errors > 0
    rescue TypeError
      self.errors = 'Invalid file'
    rescue => e
      self.errors = e.message
    end
    errors.blank?
  end

  private

  def create_or_update_ap(attributes)
    ap = Ap.where(name: attributes[:name]).first_or_initialize
    ap.assign_attributes attributes_with_associations(attributes)
    ap.save
    ap
  end

  def create_or_get_associations(attributes)
    location = create_or_get_location attributes
    ap_model = ApModel.where(name: attributes[:ap_model]).first_or_create
    ap_status = ApStatus.where(name: attributes[:ap_status]).first_or_create
    control_region = ControlRegion.where(name: attributes[:control_region]).first_or_create
    { location: location, ap_model: ap_model, ap_status: ap_status, control_region: control_region }
  end

  def create_or_get_location(attributes)
    campus = Campus.where(name: attributes[:campus]).first_or_create
    department = Department.where(name: attributes[:department], campus_id: campus.id).first_or_create
    Location.where(name: attributes[:location], department: department).first_or_create
  end

  def read_sheet
    xlsx = Roo::Excelx.new(spreadsheet)
    xlsx.sheet(SHEET_NAME)
  end

  def parse_rows(sheet)
    (2..sheet.last_row).map do |row_number|
      parse_attributes(Hash[[FIELDS.keys, sheet.row(row_number)].transpose])
    end
  end

  def create_aps(rows)
    rows.inject(0) do |aps_with_errors, attributes|
      ap = create_or_update_ap attributes
      aps_with_errors += 1 unless ap.valid?
      aps_with_errors
    end
  end

  def delete_old_aps(rows)
    Ap.where.not(name: rows.map { |row| row[:name] }).delete_all
  end

  def parse_attributes(attributes)
    attributes.select! { |_key, value| !['-', '?'].include?(value.to_s.delete(' ')) }
    attributes[:validated] = attributes[:validated] == 'OK' || nil
    attributes
  end

  def attributes_with_associations(attributes)
    associations = create_or_get_associations attributes
    attributes = attributes_without_associations attributes
    attributes.merge associations
  end

  def attributes_without_associations(attributes)
    remove_associations attributes
  end

  def remove_associations(attributes)
    attributes.reject { |key, _value| key.in? ASSOCIATIONS }
  end
end
