class MigrateChapterBodyToActionText < ActiveRecord::Migration[6.0]
  include ActionView::Helpers::TextHelper
  def change
    rename_column :chapters, :body, :body_old
    Chapter.all.each do |chapter|
      chapter.update_attribute(:body, simple_format(chapter.body_old, {}, wrapper_tag: "div"))
    end
    remove_column :chapters, :body_old
  end
end
