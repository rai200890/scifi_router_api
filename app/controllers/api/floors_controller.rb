class Api::FloorsController < ApplicationController
  respond_to :json

  def index
    @floors = Floor.all
    render json: @floors
  end

  def show
    @floor = Floor.find(params[:id])
    render json: @floor
  end

end
