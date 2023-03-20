# frozen_string_literal: true

require 'test_helper'

class CharactersIndexHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @character = characters(:character_1)
    @book = books(:book_2)
    @story = stories(:story_1)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get index I' do
    get polymorphic_url([@book, :characters])

    assert_response 200
    @characters = Character.all

    assert_select 'a[title=?]', 'Add Character'
    assert_select 'a[data-method=?]', 'post'
    assert_select 'a[href=?]', polymorphic_path([@book, :characters])

    assert_template 'characters/index'

    assert_select 'h2', "Characters for #{@book.class.name}: #{@book.name}"

    ['layouts/_nav_links', '_nav_links', 'layouts/_nav_links_for_auth', '_nav_links_for_auth',
     'application/_header', '_header', 'layouts/_messages', '_messages', 'application/_footer', '_footer'].each do |partial|
      assert_template partial: partial
    end
  end

  test 'should get index II' do
    get polymorphic_url([@story, :characters])

    assert_response 200
    @characters = Character.all

    assert_select 'a[title=?]', 'Add/Remove Characters'
    assert_select 'a[href=?]', polymorphic_path([@story, :characters_list])

    assert_template 'characters/index'

    assert_select 'h2', "Characters for #{@story.class.name}: #{@story.name}"

    ['layouts/_nav_links', '_nav_links', 'layouts/_nav_links_for_auth', '_nav_links_for_auth',
     'application/_header', '_header', 'layouts/_messages', '_messages', 'application/_footer', '_footer'].each do |partial|
      assert_template partial: partial
    end
  end
end
