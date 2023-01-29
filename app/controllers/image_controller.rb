class ImageController < ApplicationController
  include Rails.application.routes.url_helpers

  def redirect
    image = Image.where(
      'key = ? and (locale = ? or locale = ? or locale is null)',
      params[:key],
      params[:locale],
      ''
    ).first
    raise ActionController::RoutingError.new('Not Found') unless image.present?

    width = params[:width]
    height = params[:height]
    if width or height then
      redirect_to url_for image.file.variant(resize_to_limit: [width, height])
    else
      redirect_to url_for image.file
    end
  end
end
