ThinkingSphinx::Index.define :key_point, with: :active_record do
  # fields
  indexes hook
  indexes inciting_incident
  indexes key_element
  indexes first_plot_point
  indexes first_pinch_point
  indexes midpoint
  indexes second_pinch_point
  indexes third_plot_point
  indexes climax

  set_property stopwords: 'db/stop_words.txt'
end
