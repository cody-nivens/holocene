class MigrateEventTypeBodyToActionText < ActiveRecord::Migration[6.0]
    include ActionView::Helpers::TextHelper
  def change
    rename_column :event_types, :body, :body_old
    EventType.all.each do |event_type|
      event_type.update_attribute(:body, simple_format(event_type.body_old, {}, wrapper_tag: "div"))
    end
    remove_column :event_types, :body_old
  end
end
