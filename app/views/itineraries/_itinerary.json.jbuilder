json.extract! itinerary, :id, :tour_id, :city_id, :position, :stay, :created_at, :updated_at
json.url itinerary_url(itinerary, format: :json)
