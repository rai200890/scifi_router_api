class Api::ApsController < ApplicationController

  def index
    @aps = Ap.includes(location:{floor:{building: :campus}})
               .includes(:ap_model)
               .includes(:ap_status)
               .includes(:control_region)
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
