class HoloceneEventsGrid < BaseGrid

  scope do
      HoloceneEvent.order(:start_year)
  end

  attr_accessor(:object)

  filter(:start_year, :integer, :range => true, :default => [-15000, nil])
  #filter(:condition1, :dynamic)
  #filter(:condition2, :dynamic)

  filter(:region_id, :enum, header: "Region", :select => proc { Region.all.map {|c| [c.name, c.id] }})
  filter(:event_type_id, :enum, header: "Event Type", :select => proc { EventType.all.map {|c| [c.name, c.id] }})

  filter(:id, :integer, :multiple => true)


  column(:id, :html => true ) do |event|
      hidden_field_tag('holocene_event[seen][]', event.id)
      check_box_tag('holocene_event[activated][]', event.id)
  end

  column(:name, :html => true) do |holocene_event|
    link_to holocene_event.name, "/holocene_events/#{holocene_event.id}"
  end

  column(:event_type) do
      str = ""
      self.event_types.each do |etype|
          str += "#{etype.name},"
      end
      str.gsub(/,$/,'')
  end
  column(:region) do
	  self.region.name
  end

  column(:start_year) do
      HoloceneEvent.convert_ad(self.start_year)
  end
  column(:start_year_uncert)
  column(:end_year) do
      HoloceneEvent.convert_ad(self.end_year)
  end
  column(:body, :html => true) do |he|
      render :partial => "shared/summary", :locals => { :object => he}
  end
  column(:action1, :header => "", :html => true) do |holocene_event|
    link_to 'Edit', edit_holocene_event_path(holocene_event)
  end

  column(:action2, :header => "", :html => true) do |holocene_event|
    link_to 'Destroy', holocene_event, method: :delete, data: { confirm: 'Are you sure?' }
  end
end
