# frozen_string_literal: true

require 'test_helper'

class CharactersShowHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @character = characters(:character_1)
    @book = books(:book_2)
    @story = stories(:story_1)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should show character I' do
    get polymorphic_path([@book, @character])
    assert_response :success

    assert_select 'a[title=?]', 'Edit'
    assert_select 'a[href=?]', edit_polymorphic_path([@book, @character])
    assert_select 'a[title=?]', 'Back'
    assert_select 'a[href=?]', polymorphic_path([@book, :characters])
    assert_select 'a[title=?]', 'Attributes'
    assert_select 'a[href=?]', polymorphic_path([@book, @character, :character_values])
    assert_select 'a[title=?]', 'Lineage'
    assert_select 'a[href=?]', polymorphic_path([@book, @character, :lineage])
    assert_template 'characters/show'
  end

  test 'should show character II' do
    get polymorphic_path([@story, @character])
    assert_response :success

    assert_select 'a[title=?]', 'Edit'
    assert_select 'a[href=?]', edit_polymorphic_path([@story, @character])
    assert_select 'a[title=?]', 'Back'
    assert_select 'a[href=?]', polymorphic_path([@story, :characters])
    assert_select 'a[title=?]', 'Attributes'
    assert_select 'a[href=?]', polymorphic_path([@story, @character, :character_values])
    assert_select 'a[title=?]', 'Lineage'
    assert_select 'a[href=?]', polymorphic_path([@story, @character, :lineage])
    assert_template 'characters/show'
  end
end
