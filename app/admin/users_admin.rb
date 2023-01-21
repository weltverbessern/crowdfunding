Trestle.resource(:users) do
  menu do
    group I18n.t('admin.groups.outcome') do
      item I18n.t('admin.users.breadcrumbs.index'), icon: 'fa fa-heart', priority: :first
    end
  end

  table do
    column :id, link: true
    column :email
    column :created_at
    actions
  end

  form do |user|
    email_field :email, label: I18n.t('admin.users.form.fields.email')
  end

  params do |params|
    params.require(:user).permit(:email)
  end
end
