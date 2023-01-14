class PageController < ApplicationController
  def page
    @key = "page.#{params[:page]}_html"
    raise ActionController::RoutingError.new('Not Found') unless I18n.exists? @key
  end
end
