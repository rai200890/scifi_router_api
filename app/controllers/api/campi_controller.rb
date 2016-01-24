class Api::CampiController < ApplicationController
  respond_to :json

  has_scope :campus_name

  def index
    @campi = apply_scopes(Campus).all
    respond_with @campi
  end

end
