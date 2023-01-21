Trestle.resource(:translations) do
  menu do
    group I18n.t('admin.groups.content'), priority: :first do
      item I18n.t('admin.translations.breadcrumbs.index'), icon: 'fa fa-language', priority: :first
    end
  end

  scopes do
    Translation.distinct.pluck(:locale).each do |locale|
      scope locale, -> { Translation.where(locale: locale) }, group: I18n.t('admin.translations.table.headers.locale')
    end
  end

  remove_action :new, :create, :destroy

  search do |query|
    if query
      term = "%#{query.downcase}%"
      Translation.where('lower(key) like ? or lower(value) like ?', term, term)
    else
      Translation.all
    end
  end

  table do
    column :key
    column :locale
    column :value
    actions
  end

  form do |translation|
    static_field :key, label: I18n.t('admin.translations.form.fields.key')
    static_field :locale, label: I18n.t('admin.translations.form.fields.locale')
    text_field :value, label: I18n.t('admin.translations.form.fields.value')
  end

  params do |params|
    params.require(:translation).permit(:locale, :key, :value)
  end
end
