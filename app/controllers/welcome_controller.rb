class WelcomeController < ApplicationController
  def index
    @today_mod_sections = Section.where("updated_at >= ?",  Time.zone.today)
    @today_create_sections = Section.where("created_at >= ?",  Time.zone.today)
    @yesterday_mod_sections = Section.where("updated_at >= ?",  Time.zone.yesterday)
    @yesterday_create_sections = Section.where("created_at >= ?",  Time.zone.yesterday)
    @last_week_mod_sections = Section.where("updated_at >= ?",  Date.today.beginning_of_week)
    @last_week_create_sections = Section.where("created_at >= ?",  Date.today.at_end_of_week)
  end

  def stats
  end

  def map_test
  end

  def tags
  end
end


