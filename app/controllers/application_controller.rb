class ApplicationController < ActionController::Base
  protect_from_forgery

  def default_url_options
    { locale: I18n.locale }
  end

  before_action :set_locale

  private

  def set_locale
    I18n.locale = extract_locale || Settings.default_locale || I18n.default_locale
  end

  def extract_locale
    parsed_locale = params[:locale]
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end
end
