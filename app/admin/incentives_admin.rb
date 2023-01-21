Trestle.resource(:incentives) do
  menu do
    group I18n.t('admin.groups.content'), priority: :first do
      item I18n.t('admin.incentives.breadcrumbs.index'), icon: 'fa fa-box'
    end
  end

  table do
    column :amount, format: :currency
    column :description, truncate: { length: 100 }
    column :limit
    actions
  end

  form do |incentive|
    number_field :amount, step: 0.01, label: I18n.t('admin.incentives.form.fields.amount')
    text_field :amount_display, label: I18n.t('admin.incentives.form.fields.amount_display')
    text_area :description, label: I18n.t('admin.incentives.form.fields.description')
    text_field :shipping_desc, label: I18n.t('admin.incentives.form.fields.shipping_desc')
    number_field :limit, label: I18n.t('admin.incentives.form.fields.limit')
  end

  params do |params|
    params.require(:incentive).permit(:amount, :amount_display, :description, :shipping_desc, :limit)
  end
end
