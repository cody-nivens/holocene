ThinkingSphinx::Index.define :scene, with: :active_record do
  # fields
  indexes abc, sortable: true
  set_property stopwords: 'db/stop_words.txt'
end
