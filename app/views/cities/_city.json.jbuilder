json.extract! city, :id, :name, :name_ascii, :lat, :lng, :country, :iso2, :iso3, :admin_name, :capital, :population,
              :simple_map_id, :created_at, :updated_at
json.url city_url(city, format: :json)
