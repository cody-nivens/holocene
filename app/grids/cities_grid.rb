class CitiesGrid < BaseGrid
  scope do
    City.order(:name)
  end

  attr_accessor :tour

  filter(:name, :string, header: 'Name LIKE', input_options: { "data-grids-target": "name" }) do |value|
    where('name like ?', "%#{value}%")
  end

  filter(:lat, :string, header: 'Lat Near', input_options: { "data-grids-target": "lat" }) do |value, scope, _grid|
    increment = Math.sqrt(6000) * 1.22 / 69.0
    increment ||= 0.5
    scope.where(lat: (value.to_f - increment)..(value.to_f + increment))
  end

  filter(:lng, :integer, range: true, default: [nil, nil], input_options: { "data-grids-target": "lng" })

  filter(:population, :integer, header: 'Population greater than', input_options: { "data-grids-target": "population" }) do |value|
    where('population >= ?', value)
  end

  column(:id, html: true, if: proc { |grid| !grid.tour.nil? }) do |event|
    hidden_field_tag('city[seen][]', event.id)
    check_box_tag('city[activated][]', event.id)
  end

  column(:name, html: true) do |he|
    link_to he.name, city_path(he), method: :get
  end

  column(:lat)
  column(:lng)
  column(:country)
  column(:iso2)
  column(:iso3)
  column(:admin_name)
  column(:capital)
  column(:population)

  column(:action2, header: '', html: true) do |city|
    link_to (fa_icon 'edit'), edit_city_path(city), data: { "turbo-frame": "new_object" }, title: 'Edit'
  end
  column(:action3, header: '', html: true) do |city|
    link_to (fa_icon 'trash'), city, method: :delete, data: { confirm: 'Are you sure?' }, title: 'Destroy'
  end
end
