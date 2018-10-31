json.extract! holocene_event, :id, :name, :start_year, :end_year, :start_year_uncert, :start_year_mod, :end_year_uncert, :end_year_mod, :event_type, :body, :region, :created_at, :updated_at
json.url holocene_event_url(holocene_event, format: :json)
