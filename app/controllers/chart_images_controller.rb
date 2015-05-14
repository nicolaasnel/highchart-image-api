class ChartImagesController < ApplicationController
  def create
    File.open(chart_image.file_path, 'r') do |f|
        send_data f.read, type: "image/png"
    end
    chart_image.close
  end

  private

  def chart_image
    @chart_image ||= ChartImage.new(input: params[:input], width: params[:width])
  end

end
