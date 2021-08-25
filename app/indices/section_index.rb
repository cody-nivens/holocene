ThinkingSphinx::Index.define :section, :with => :active_record do
  # fields
  indexes name, :sortable => true
  set_property :stopwords => 'db/stop_words.txt'
end
