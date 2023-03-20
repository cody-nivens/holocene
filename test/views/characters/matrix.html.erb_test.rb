# frozen_string_literal: true

require 'test_helper'

class CharactersMatrixHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @character = characters(:character_1)
    @book = books(:book_2)
    @story = stories(:story_1)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should show matrix' do
    get character_matrix_path(@book)
    assert_response :success

    assert_template 'characters/matrix'
  end
end
