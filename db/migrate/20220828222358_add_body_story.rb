class AddBodyStory < ActiveRecord::Migration[6.1]
  def change
    Story.all.each do |story|
      story.summary_body = story.summary
      story.save
    end
  end
end
