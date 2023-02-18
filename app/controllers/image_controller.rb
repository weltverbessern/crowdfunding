class ImageController < ApplicationController
  include Rails.application.routes.url_helpers

  ImageVariants = {
    'video_placeholder' => [512, 385],
    'key_points' => [700, 500]
  }

  def redirect
    image = Image.where(
      'key = ? and (locale = ? or locale = ? or locale is null)',
      params[:key],
      params[:locale],
      ''
    ).first
    raise ActionController::RoutingError.new('Not Found') unless image.present?

    variant = params[:for]
    if variant and ImageVariants.has_key?(variant) then
      redirect_to url_for image.file.variant(resize_to_limit: ImageVariants[variant])
    else
      redirect_to url_for image.file
    end
  end
end
