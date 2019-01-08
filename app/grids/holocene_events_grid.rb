class HoloceneEventsGrid < BaseGrid

  scope do
      HoloceneEvent.order(:start_year)
  end

  attr_accessor(:object)

  filter(:start_year, :integer, :range => true, :default => [-15000, nil])

  filter(:region_id, :enum, header: "Region", :select => proc { Region.all.map {|c| [c.name, c.id] }})

  filter(:id, :integer, :multiple => true)


  column(:id, :html => true, :if => proc {|grid| !grid.object.nil? } ) do |event|
      hidden_field_tag('holocene_event[seen][]', event.id)
      check_box_tag('holocene_event[activated][]', event.id)
  end

  column(:name, :html => true) do |he|
    link_to he.name, "/holocene_events/#{he.id}"
  end

  column(:event_type, :html => true) do |he|
      str = ""
      he.event_types.each do |etype|
          str += "#{etype.name}, "
      end
      str.gsub(/, $/,'')
  end
  column(:region) do
	  self.region.name
  end

  column(:start_year, :html => true) do |he|
      HoloceneEvent.convert_ad(he.start_year,he.start_year_uncert)
  end
  #column(:start_year_uncert)
  column(:end_year,:html => true) do |he|
      HoloceneEvent.convert_ad(he.end_year)
  end
  column(:image, :html => true) do |he|
    if he.image.attached? 
      image_tag(he.image.variant(resize: "100x100>"), :alt => he.image.filename.to_s)
    end
  end
  column(:lat)
  column(:lng)
  column(:body, :html => true) do |he|
      render :partial => "shared/summary", :locals => { :object => he}
  end
  column(:action1, :header => "", :html => true) do |holocene_event|
    link_to (fa_icon "search-plus"), holocene_event_path(holocene_event), :title => 'Show'
  end
  column(:action2, :header => "", :html => true) do |holocene_event|
    link_to (fa_icon "edit"), edit_holocene_event_path(holocene_event), :title => 'Edit'
  end
  column(:action3, :header => "", :html => true) do |holocene_event|
    link_to (fa_icon "trash-o"), holocene_event, method: :delete, data: { confirm: 'Are you sure?' }, :title => 'Destroy'
  end
end
