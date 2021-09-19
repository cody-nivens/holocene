ThinkingSphinx::Index.define 'action_text/rich_text'.to_sym, with: :active_record do
  # fields
  indexes name, sortable: true
  indexes body
  set_property stopwords: 'db/stop_words.txt'
end
