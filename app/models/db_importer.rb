require 'roo'

class DbImporter
  SHEET_NAME = 'Tabela'

  FIELDS = {name: "AP ", wan_mac_address: "MAC / WAN (ETH0)", wlan_mac_address: "WLAN (ETIQUETA)", campus: "CAMPUS",
          building: "DEPARTAMENTO", location: "LOCAL", switch_name: "SWITCH", port: "PORTA", socket: "TOMADA",
          panel_port: "P.PANEL", ap_status: "STATUS", ip: "IP DOS APS", comments: "COMENTARIOS", validated: "VALIDADO",
              syslocation: "SYSLOCATION", latitude: "LATITUDE", longitude: "LONGITUDE", height: "ALTURA",
          control_region:"REGIÃO DE CONTROLE SCIFI", ap_model: "MODELO DO AP"}

  ASSOCIATIONS = [:campus, :building, :location, :ap_status, :ap_model,:control_region]

  attr_accessor :sheet, :errors

  def initialize spreadsheet
    self.sheet = get_sheet spreadsheet
    self.errors = nil
  end

  def update
    self.errors = nil
    aps_with_errors = 0
    parse_rows(sheet).each do |attributes|
      associations_ids = create_or_get_associations_ids attributes
        unless Ap.where(associations_ids).exists?
          fields = attributes_without_associations(attributes).merge(associations_ids)
          ap = Ap.create(fields)
          aps_with_errors+=1 unless ap.valid?
        end
    end
    self.errors = "#{aps_with_errors} could not be imported" if aps_with_errors > 0
    errors.blank?
  end

  private

  def create_or_get_associations_ids attributes
    campus = Campus.where(name: attributes[:campus]).first_or_create
    building = Building.where(name: attributes[:building], campus_id: campus.id).first_or_create
    floor = Floor.where(number: get_floor_number(attributes[:location]), building_id: building.id).first_or_create
    location = Location.where(name: attributes[:location], floor_id: floor.id).first_or_create
    ap_model = ApModel.where(name: attributes[:ap_model]).first_or_create
    ap_status = ApStatus.where(name: attributes[:ap_status]).first_or_create
    control_region = ControlRegion.where(name: attributes[:control_region]).first_or_create
    { location_id: location.id, ap_model_id: ap_model.id, ap_status_id: ap_status.id,
      control_region_id: control_region.id }
  end

  def get_sheet spreadsheet
    xlsx = Roo::Excelx.new(spreadsheet)
    xlsx.sheet(SHEET_NAME)
  end

  def get_floor_number location
    floor_number = location.to_s.match(/((\S+) ANDAR)/).to_a.last
    location and location.include?("TERREO") ? "0" : floor_number
  end

  def parse_rows sheet
    (2..sheet.last_row).map do |row_number|
        Hash[[FIELDS.keys, sheet.row(row_number)].transpose]
     end
  end

  def parse_attributes attributes
    attributes.select!{|key, value| !["-",'?'].include?(value.to_s.gsub(" ",""))}
    attributes[:validated] = attributes[:validated] == 'OK' || nil
    attributes
  end

  def attributes_with_association_ids attributes
    associations_ids = create_or_get_associations_ids attributes
    attributes = attributes_without_associations attributes
    attributes.merge associations_ids
  end

  def attributes_without_associations attributes
    remove_associations parse_attributes(attributes)
  end

  def remove_associations attributes
    attributes.reject{|key, value| key.in? ASSOCIATIONS}
  end

end
