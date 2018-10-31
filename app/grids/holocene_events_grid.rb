class HoloceneEventsGrid < BaseGrid

  scope do
    HoloceneEvent
  end

  filter(:start_year, :integer)
  filter(:end_year, :integer)
  filter(:id, :integer, :multiple => true)

  column(:name, :html => true) do |holocene_event|
    link_to holocene_event.name, "/holocene_events/#{holocene_event.id}"
  end

  column(:event_type) do
	  self.event_type.name
  end
  column(:region) do
	  self.region.name
  end

  column(:start_year)
  column(:start_year_uncert)
  column(:end_year)
  column(:body, :html => true) do |he|
      render :partial => "shared/summary", :locals => { :holocene_event => he}
  end
  column(:action1, :header => "", :html => true) do |holocene_event|
    link_to 'Edit', edit_holocene_event_path(holocene_event)
  end
  column(:action2, :header => "", :html => true) do |holocene_event|
    link_to 'Destroy', holocene_event, method: :delete, data: { confirm: 'Are you sure?' }
  end
end
