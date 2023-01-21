Trestle.configure do |config|
  config.site_title = '/admin'
  config.root_breadcrumbs = -> { [Trestle::Breadcrumb.new('/admin', Trestle.config.root)] }

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
