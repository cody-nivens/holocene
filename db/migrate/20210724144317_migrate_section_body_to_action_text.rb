class MigrateSectionBodyToActionText < ActiveRecord::Migration[6.0]
  include ActionView::Helpers::TextHelper
  def change
    rename_column :sections, :body, :body_old
    Section.all.each do |section|
      section.update_attribute(:body, simple_format(section.body_old, {}, wrapper_tag: "div"))
    end
    remove_column :sections, :body_old
  end
end
