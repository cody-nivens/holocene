# frozen_string_literal: true

require 'test_helper'

class CharactersScenesHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @character = characters(:character_1)
    @book = books(:book_2)
    @story = stories(:story_1)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should show scenes' do
    get character_scenes_path(@book)
    assert_response :success

    assert_select 'a[text()=?]', 'Back'
    assert_select 'a[href=?]', polymorphic_path(@book)
    assert_select '.footer>div>a', 1
    assert_template 'characters/scenes'
  end
end
