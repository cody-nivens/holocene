class MigrateHoloceneEventBodyToActionText < ActiveRecord::Migration[6.0]
  include ActionView::Helpers::TextHelper
  def change
    rename_column :holocene_events, :body, :body_old
    HoloceneEvent.all.each do |holocene_event|
      holocene_event.update_attribute(:body, simple_format(holocene_event.body_old, {}, wrapper_tag: "div"))
    end
    remove_column :holocene_events, :body_old
  end
end
