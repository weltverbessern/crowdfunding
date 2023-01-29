Trestle.resource(:images) do
  menu do
    group I18n.t('admin.groups.content'), priority: :first do
      item I18n.t('admin.images.breadcrumbs.index'), icon: 'fa fa-image'
    end
  end

  active_storage_fields do
    [:file]
  end

  table do
    column :key, truncate: { length: 100 }
    column :locale
    actions
  end

  form do |image|
    text_field :key, label: I18n.t('admin.images.form.fields.key')
    text_field :locale, label: I18n.t('admin.images.form.fields.locale')
    active_storage_field :file, label: I18n.t('admin.images.form.fields.file')
  end

  params do |params|
    params.require(:image).permit(:key, :locale, :file)
  end
end
