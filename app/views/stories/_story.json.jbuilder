json.extract! story, :id, :title, :summary_body, :book_id, :created_at, :updated_at
json.url story_url(story, format: :json)
