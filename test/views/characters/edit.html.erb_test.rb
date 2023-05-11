# frozen_string_literal: true

require 'test_helper'

class CharactersEditHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @character = characters(:character_1)
    @book = books(:book_2)
    @story = stories(:story_1)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get edit I' do
    get edit_polymorphic_url([@book, @character])
    assert_response :success

    assert_select 'a[title=?]', 'Show'
    assert_select 'a[href=?]', polymorphic_path([@book, @character])
    assert_select 'a[title=?]', 'Back'
    assert_select 'a[href=?]', polymorphic_path([@book, :characters])
    assert_template 'characters/edit'
  end

  test 'should get edit II' do
    get edit_polymorphic_url([@story, @character])
    assert_response :success

    assert_select 'a[title=?]', 'Show'
    assert_select 'a[href=?]', polymorphic_path([@story, @character])
    assert_select 'a[title=?]', 'Back'
    assert_select 'a[href=?]', polymorphic_path([@story, :characters])
    assert_template 'characters/edit'
  end
end
