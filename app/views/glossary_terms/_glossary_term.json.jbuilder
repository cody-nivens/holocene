json.extract! glossary_term, :id, :name, :body, :see_id, :seealso_id, :acronym_id, :created_at, :updated_at
json.url glossary_term_url(glossary_term, format: :json)
