#encoding: utf-8
require 'thor/rails'

class Aps < Thor
  include Thor::Rails
  desc "update", "update aps from spreadsheet"
  def update(spreadsheet)
    importer = DBImporter.new spreadsheet: spreadsheet
    importer.update
  end

end
