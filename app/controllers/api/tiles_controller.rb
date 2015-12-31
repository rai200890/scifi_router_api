class Api::TilesController < ApplicationController

  respond_to :png

  def index
    z = tiles_params[:z].to_i
    x = Math.log(tiles_params[:x].to_i.abs, 256).ceil
    y = Math.log(tiles_params[:y].to_i.abs, 256).ceil
    path = "#{Rails.root}/public/images/planta_ic_4_andar/#{z}/map_tile_#{x}_#{y}.png"
    respond_with do |format|
      format.png do
        if File.exists? path
          send_file path, type: 'image/png', disposition: 'inline'
        else
          render nothing: true, status: 404
        end
      end
    end
  end

  def tiles_params
    params.permit(:x, :y, :z, :format)
  end

end
