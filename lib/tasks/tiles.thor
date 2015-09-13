require 'thor/rails'
require 'fastimage'
require 'byebug'
require 'mapstatic'
class Tiles < Thor
  include Thor::Actions
  include Thor::Rails

  method_option :directory, :aliases => "-d", :desc => "Specify destination directory"
  method_option :zoom, :aliases => "-z", :desc => "Specify zoom level"
  desc "make", "Make tiles from image file"
  def make image
    dirname = File.basename(image, ".*")
    run "vendor/plugins/gdal2tiles-leaflet/gdal2tiles.py -l -p raster -z 0-#{options[:zoom]} -w none #{image} #{options[:directory]}/#{dirname}"
  end

  desc "image_read", "Test tile making"
  def image_read path
    path = "#{::Rails.root}/#{path}"
    size = ::FastImage.size(path, raise_on_failure: true)
    width, height = size
    puts "width: #{width}, height: #{height}"

    map = ::Mapstatic::Map.new(
        zoom: 5,
        lat: 0,
        lng: 0,
        width: width,
        height: height,
        provider: 'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png')

    map.render_map path

    puts map.metadata
  end

end
