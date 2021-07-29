class MigrateAsideBodyToActionText < ActiveRecord::Migration[6.0]
  include ActionView::Helpers::TextHelper
  def change
    rename_column :asides, :body, :body_old
    Aside.all.each do |aside|
      aside.update_attribute(:body, simple_format(aside.body_old, {}, wrapper_tag: "div"))
    end
    remove_column :asides, :body_old
  end
end
