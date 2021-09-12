class ItinerariesGrid < BaseGrid

  scope do
      Itinerary.order(:position)
  end

  attr_accessor :tour

  def row_class(issue)
    case issue.city.country
    when "Japan" then "green"
    when "India" then "red"
    else "blue"
    end
  end

  filter(:name, :string, header: "Name LIKE", input_options: { placeholder: 'Specify Text In Itinerary Name' }) do |value|
    self.where("name like ?","%#{value}%")
  end

  column(:name, :html => true) do |he|
    link_to he.name, story_tour_itinerary_path(@tour.story,@tour,he)
  end

  column(:city,:order=>'cities.name asc',:order_desc=>'cities.name desc') do |itinerary|
    itinerary.city.name
  end

  column(:lat,:order=>'cities.lat asc',:order_desc=>'cities.lat desc') do |itinerary|
    itinerary.city.lat
  end

  column(:lng,:order=>'cities.lng asc',:order_desc=>'cities.lng desc') do |itinerary|
    itinerary.city.lng
  end

  column(:admin_name,:order=>'cities.admin_name asc',:order_desc=>'cities.admin_name desc') do |itinerary|
    itinerary.city.admin_name
  end

  column(:country,:order=>'cities.country asc',:order_desc=>'cities.country desc') do |itinerary|
    itinerary.city.country
  end

  column(:stay)

  column(:distance, :html => true, description: "Great Circle Calculation") do |itinerary|
    prev = itinerary.higher_item
    prev_city = (prev.nil? ? nil : prev.city)
    (prev.nil? ? '' : "%d" % itinerary.city.distance(prev_city))
  end

  column(:action2, :header => "", :html => true) do |itinerary|
    link_to (fa_icon "edit"), edit_story_tour_itinerary_path(@tour.story,@tour,itinerary), :title => 'Edit'
  end

  column(:action3, :header => "", :html => true) do |itinerary|
    link_to (fa_icon "trash-o"), story_tour_itinerary_path(@tour.story,@tour,itinerary), method: :delete, data: { confirm: 'Are you sure?' }, :title => 'Destroy'
  end
end
