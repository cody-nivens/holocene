# frozen_string_literal: true

require 'test_helper'

class CharacterValueTest < ActiveSupport::TestCase
  setup do
    @book = books(:book_2)
  end

  test 'stats_2' do
    category = CharacterCategory.where(name: 'Gender')[0]
    character_attribute = CharacterAttribute.where(character_category_id: category.id, name: 'Gender')[0]

    character_attribute_2 = 'sex'

    results = CharacterValue.stats_2(@book.characters, category, character_attribute, character_attribute_2)
  end
end
