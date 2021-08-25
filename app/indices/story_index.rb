ThinkingSphinx::Index.define :story, :with => :active_record do
  # fields
  indexes title, :sortable => true
  indexes summary
  set_property :stopwords => 'db/stop_words.txt'
end
