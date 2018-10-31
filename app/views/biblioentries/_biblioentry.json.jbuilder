json.extract! biblioentry, :id, :name, :xreflabel, :copyright_year, :copyright_holder, :publisher, :created_at, :updated_at
json.url biblioentry_url(biblioentry, format: :json)
