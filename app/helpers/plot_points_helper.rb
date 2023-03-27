module PlotPointsHelper

  def plot_points_options_for_select(scenes)
    s = ""
    scenes.each do |scene_id|
      scene = Scene.find_by_id(scene_id)
      s += "<option value=\"#{scene.id}\">#{scene.name}</option>"
    end
    return s
  end

end
