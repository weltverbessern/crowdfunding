# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Import translations to database
locales_to_import = I18n.available_locales
scopes_to_import = [:project, :crowdfunding]

def import_translations(locale, prefix, x)
    if x.is_a? Hash
        prefix += '.' unless prefix.empty?
        x.each { |key, value| import_translations(locale, prefix + key.to_s, value) }
    else
        Translation.create!(locale: locale, key: prefix, value: x)
    end
end

translations_hash = I18n.backend.send(:translations)
locales_to_import.each do |locale|
    scopes_to_import.each do |scope|
        import_translations(locale, scope.to_s, translations_hash[locale][scope])
    end
end
