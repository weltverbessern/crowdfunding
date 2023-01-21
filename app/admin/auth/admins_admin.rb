Trestle.resource(:admins, model: Admin, scope: Auth) do
  menu do
    group I18n.t('admin.groups.configuration'), priority: :last do
      item I18n.t('admin.auth/admins.breadcrumbs.index'), icon: 'fas fa-users'
    end
  end

  table do
    column :email, link: true
    column :first_name
    column :last_name
    actions do |a|
      a.delete unless a.instance == current_user
    end
  end

  form do |admin|
    text_field :email, label: I18n.t('admin.auth/admins.form.fields.email')

    row do
      col(sm: 6) { text_field :first_name, label: I18n.t('admin.auth/admins.form.fields.first_name') }
      col(sm: 6) { text_field :last_name, label: I18n.t('admin.auth/admins.form.fields.last_name') }
    end

    row do
      col(sm: 6) { password_field :password, label: I18n.t('admin.auth/admins.form.fields.password') }
      col(sm: 6) { password_field :password_confirmation, label: I18n.t('admin.auth/admins.form.fields.password_confirmation') }
    end
  end

  params do |params|
    params.require(:admin).permit(:email, :first_name, :last_name, :password, :password_confirmation)
  end
end
