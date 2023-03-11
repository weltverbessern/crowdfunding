class PageController < ApplicationController
  def page
    # Take the full path as lookup key (e.g. aaa/bbb/ccc)
    @key = "page.#{params[:page]}_html"
    # If it does not exist, only take the first path part (e.g. aaa) to allow for frontend routing
    @key = "page.#{params[:page].split('/').first}_html" unless I18n.exists? @key
    # If it still does not exist, throw 404
    raise ActionController::RoutingError.new('Not Found') unless I18n.exists? @key
  end
end
