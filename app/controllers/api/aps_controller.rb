# frozen_string_literal: true
class Api::ApsController < ApplicationController
  include PaginationConcern
  include AuthConcern

  has_scope :with_details, type: :boolean, default: true
  has_scope :department_id

  def index
    @aps = apply_scopes(Ap).all
    render json: @aps, status: :ok
  end

  def show
    @ap = Ap.where(id: params[:id]).first
    if @ap
      render json: @ap, status: :ok
    else
      head :not_found
    end
  end

  def update
    @ap = Ap.where(id: params[:id]).first
    if @ap && @ap.update_attributes(ap_params)
      render json: @ap, status: :no_content
    else
      head :unprocessable_entity
    end
  end

  private

  def ap_params
    params.require(:ap).permit(:map_latitude, :map_longitude)
  end
end
