Trestle.resource(:orders) do
  menu do
    group I18n.t('admin.groups.outcome') do
      item I18n.t('admin.orders.breadcrumbs.index'), icon: 'fa fa-store'
    end
  end

  remove_action :new, :create

  table do
    column :order_number, link: true
    column :user
    column :incentive
    column :price, format: :currency
    column :created_at
    column :payment_status, align: :center do |order|
      if order.payment_status == 'completed' then
        status_tag(icon('fa fa-check'), :success)
      elsif order.payment_status == 'processing' then
        status_tag(icon('fa fa-hourglass-half'), :warning)
      else
        status_tag(I18n.t('admin.orders.table.headers.payment_status_pending'), :danger)
      end
    end
    actions
  end

  form do |order|
    row do
      col { static_field :order_number, label: I18n.t('admin.orders.form.fields.order_number') }
      col { static_field :payment_status, label: I18n.t('admin.orders.form.fields.payment_status') }
    end
    collection_select :user, User.all, :id, :email, readonly: true, label: I18n.t('admin.orders.form.fields.user')
    row do
      col { text_field :first_name, label: I18n.t('admin.orders.form.fields.first_name') }
      col { text_field :last_name, label: I18n.t('admin.orders.form.fields.last_name') }
    end
    text_field :address_line1, label: I18n.t('admin.orders.form.fields.address_line1')
    text_field :address_line2, label: I18n.t('admin.orders.form.fields.address_line2')
    row do
      col { text_field :zip, label: I18n.t('admin.orders.form.fields.zip') }
      col { text_field :city, label: I18n.t('admin.orders.form.fields.city') }
    end
    text_field :country, label: I18n.t('admin.orders.form.fields.country')
  end

  params do |params|
    params.require(:order).permit(:first_name, :last_name, :address_line1, :address_line2, :zip, :city, :country)
  end
end
