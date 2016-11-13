# frozen_string_literal: true
class Api::DbImporterController < ApplicationController
  include AuthConcern

  def create
    file = params[:file]
    importer = DbImporter.new(file.path)
    if importer.update
      render json: { success: 'Database updated successfully' }.to_json, status: :ok
    else
      render json: { errors: importer.errors }, status: :unprocessable_entity
    end
  end
end
