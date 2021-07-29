class MigrateRegionBodyToActionText < ActiveRecord::Migration[6.0]
  include ActionView::Helpers::TextHelper
  def change
    rename_column :regions, :body, :body_old
    Region.all.each do |region|
      region.update_attribute(:body, simple_format(region.body_old, {}, wrapper_tag: "div"))
    end
    remove_column :regions, :body_old
  end
end
