class Api::ApsController < ApplicationController
  include PaginationConcern
  
  respond_to :json

  has_scope :with_details, type: :boolean, default: true
  has_scope :floor_id

  def index
    @aps = apply_scopes(Ap).all
    render json: @aps
  end

  def show
    @ap = Ap.find(params[:id])
    render json: @ap
  end

  def update
    @ap = Ap.find(params[:id])
    @ap = @ap.update_attributes(ap_params)
    respond_with @ap
  end

  private

  def ap_params
    params.require(:ap).permit(:latitude, :longitude)
  end

end
