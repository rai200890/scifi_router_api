class Api::DbImporterController < ApplicationController

  respond_to :json

  def create
    file = params[:file]
    importer = DbImporter.new(spreadsheet: file.path)
    importer.update
    render json: {status: :ok}.to_json
  end

end
