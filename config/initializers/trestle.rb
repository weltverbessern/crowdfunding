Trestle.configure do |config|
  brand = ENV['WELTVERBESSERN_BRAND'] || 'Weltverbessern'
  config.site_title = brand
  config.root_breadcrumbs = -> { [Trestle::Breadcrumb.new(brand, Trestle.config.root)] }

  config.after_action do |controller|
    I18n.backend.reload!
  end

  config.auth.user_class = -> { Admin }
  config.auth.user_admin = -> { :"auth/account" }
  config.auth.avatar = false
  config.auth.format_user_name = ->(user) {
    content_tag(:strong, "#{user.first_name} #{user.last_name}")
  }
end
