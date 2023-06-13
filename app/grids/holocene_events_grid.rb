class HoloceneEventsGrid < BaseGrid
  scope do
    HoloceneEvent.order(:start_year)
  end

  attr_accessor(:object)
  attr_accessor(:command)

  filter(:start_year, :integer, range: true, default: [nil, nil], input_options: { "data-grids-target": "start_year" })

  filter(:region_id, :enum, header: 'Region', select: proc { Region.all.order(:name).map { |c| [c.name, c.id] } }, input_options: { "data-grids-target": "region_id" })

  filter(:id, :integer, multiple: true, input_options: { "data-grids-target": "id" })

  filter(:name, :string, header: 'Name LIKE', input_options: { "data-grids-target": "name" }) do |value|
    where('name like ?', "%#{value}%")
  end

  filter(:event_type, :enum, header: 'Event Type', input_options: { "data-grids-target": "event_type" }, select: proc {
    EventType.all.order(:name).map { |c| [c.name, c.id] }
  }) do |value|
    ids = map { |x| (x.event_types.ids.include?(value.to_i) == false ? nil : x.event_types.ids) }.compact.flatten
    res = []
    ids.each do |id|
      et = EventType.find(id)
      res << et.holocene_events unless et.holocene_events.nil?
    end
    if res.length == 0
      where('id is null')
    else
      where('id in (?)', res[0].ids)
    end
  end

  column(:id, html: true, if: proc { |grid| !grid.object.nil? }) do |event|
    hidden_field_tag('holocene_event[seen][]', event.id)
    check_box_tag('holocene_event[activated][]', event.id)
  end

  column(:name, html: true) do |he|
    link_to he.name, holocene_event_path(he), method: :get
  end

  column(:event_type, html: true) do |he|
    str = ''
    he.event_types.each do |etype|
      str += "#{link_to etype.name, event_type_path(etype)}, "
    end
    str.gsub!(/, $/, '')
    str.html_safe
  end
  column(:region, html: true) do |he|
    str = link_to he.region.name, region_path(he.region).to_s
    str.html_safe
  end

  column(:start_year, html: true) do |he|
    HoloceneEvent.convert_ad(he.start_year, he.start_year_uncert)
  end
  # column(:start_year_uncert)
  column(:end_year, html: true) do |he|
    HoloceneEvent.convert_ad(he.end_year)
  end
  # column(:image, :html => true) do |he|
  #  if he.image.attached?
  #    image_tag(he.image.variant(resize: "100x100>"), :alt => he.image.filename.to_s)
  #  end
  # end
  # column(:lat)
  # column(:lng)
  column(:body, html: true) do |he|
    render partial: 'shared/summary', locals: { object: he }
  end
  # column(:action1, :header => "", :html => true) do |holocene_event|
  #  link_to (fa_icon "search-plus"), holocene_event_path(holocene_event), :title => 'Show'
  # end
  column(:action2, header: '', html: true) do |holocene_event|
    link_to (fa_icon 'edit'), edit_holocene_event_path(holocene_event), data: { "turbo-frame": "new_object" }, title: 'Edit'
  end
  column(:action3, header: '', html: true) do |holocene_event|
    link_to (fa_icon 'trash'), holocene_event, method: :delete, data: { confirm: 'Are you sure?' },
      title: 'Destroy'
  end
end
