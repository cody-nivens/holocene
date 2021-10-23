class MigrateBookBodyToActionText < ActiveRecord::Migration[6.0]
  include ActionView::Helpers::TextHelper
  def change
    #rename_column :books, :body, :body_old
    #Book.all.each do |book|
    #  book.update_attribute(:body, simple_format(book.body_old, {}, wrapper_tag: "div"))
    #end
    #remove_column :books, :body_old
    #rename_column :books, :publisher, :publisher_old
    #Book.all.each do |book|
    #  book.update_attribute(:publisher, simple_format(book.publisher_old, {}, wrapper_tag: "div"))
    #end
    #remove_column :books, :publisher_old
  end
end
