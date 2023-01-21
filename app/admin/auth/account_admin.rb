Trestle.resource(:account, model: Admin, scope: Auth, singular: true) do
  instance do
    current_user
  end

  remove_action :new, :edit, :destroy

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
    params.require(:account).permit(:email, :first_name, :last_name, :password, :password_confirmation)
  end
end
