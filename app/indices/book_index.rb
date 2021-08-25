ThinkingSphinx::Index.define :book, :with => :active_record do
  # fields
  indexes name, :sortable => true
  indexes sub_name, :sortable => true
  set_property :stopwords => 'db/stop_words.txt'
end
