class AddTermToGlossaryTerm < ActiveRecord::Migration[5.2]
  def change
    add_column :glossary_terms, :term, :string
  end
end
