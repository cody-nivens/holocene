class ScenesGrid

  include Datagrid

  scope do
    Scene.order(:abc)
  end

  attr_accessor(:object)

  #filter(:category, :enum, select: ["first", "second"])
  #filter(:disabled, :xboolean)
  filter(:abc,:string)
  #filter(:group_id, :integer, multiple: true)
  #filter(:logins_count, :integer, range: true)
  #filter(:group_name, :string, header: "Group") do |value|
  #  self.joins(:group).where(:groups => {:name => value})
  #end

  column(:abc)
  column(:check)
  column(:summary, :html => true) do |he|
    link_to he.summary, "/scenes/#{he.id}"
  end

  column(:place)
  column(:time)
  column(:scene_sequel)
  column(:goal_reaction)
  column(:conflict_dilemma)
  column(:disaster_decision)
  column(:short_term_goal)
  column(:long_term_goal)
  column(:over_arching_goal)
#  column(:id, :html => true, :if => proc {|grid| !grid.object.nil? } ) do |event|
#      hidden_field_tag('scene[seen][]', event.id)
#      check_box_tag('scene[checked][]', event.id)
#  end


  #column(:group, order: -> { joins(:group).order(groups: :name) }) do |user|
  #  user.name
  #end
  #column(:active, header: "Activated") do |user|
  #  !user.disabled
  #end

  column(:action2, :header => "", :html => true) do |scene|
    link_to (fa_icon "edit"), edit_book_scene_path(:book_id => @book.id, :id => scene.id), :title => 'Edit'
  end
  column(:action3, :header => "", :html => true) do |scene|
    link_to (fa_icon "trash-o"), book_scene_path(:book_id => @book.id, :id => scene.id), method: :delete, data: { confirm: 'Are you sure?' }, :title => 'Destroy'
  end

end

