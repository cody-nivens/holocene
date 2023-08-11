json.extract! page, :id, :name, :user_id, :slug, :created_at, :updated_at
json.url page_url(page, format: :json)
