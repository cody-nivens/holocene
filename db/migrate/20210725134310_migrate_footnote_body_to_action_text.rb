class MigrateFootnoteBodyToActionText < ActiveRecord::Migration[6.0]
  include ActionView::Helpers::TextHelper
  def change
    rename_column :footnotes, :body, :body_old
    Footnote.all.each do |footnote|
      footnote.update_attribute(:body, simple_format(footnote.body_old, {}, wrapper_tag: "div"))
    end
    remove_column :footnotes, :body_old
  end
end
