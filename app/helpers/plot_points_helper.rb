module PlotPointsHelper

  def plot_points_options_for_select(scenes)
    s = ""
    scenes.each do |scene_id|
      scene = Scene.find_by_id(scene_id)
      s += "<option value=\"#{scene.id}\">#{scene.name}</option>"
    end
    return s
  end

  def scenes_list_ul(plot_point)
    s = "<ul>"
    scenes_ids = Scene.get_scenes_to_array(plot_point.book)
    plot_point_scene_ids = plot_point.scenes.pluck(:id)
    scenes_ids.each do |scene_id|
      if plot_point_scene_ids.include?(scene_id)
        scene = Scene.find_by_id(scene_id)
        s += "<li>#{link_to scene.name, scene_path(scene)}</li>"
      end
    end
    return s + "</ul>"
  end
end
