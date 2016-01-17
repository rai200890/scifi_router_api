class Api::DbImporterController < ApplicationController

  def create
    file = params[:file]
    importer = DbImporter.new(file.path)
    if importer.update
      render json: {success: "Database updated successfully"}.to_json, status: 200
    else
      render json: {errors: importer.errors}.to_json, status: :unprocessable_entity
    end
  end

end
