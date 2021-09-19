require 'test_helper'

class CharactersListHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @character = characters(:character_1)
    @book = books(:book_2)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get list' do
    get book_characters_list_url(book_id: @book.id)

    assert_response 200

    assert_template 'characters/list'

    assert_select 'h1', 'Characters for Book: The Phantom'

    ['layouts/_nav_links', '_nav_links', 'layouts/_nav_links_for_auth', '_nav_links_for_auth',
     'application/_header', '_header', 'layouts/_messages', '_messages', 'application/_footer', '_footer'].each do |partial|
      assert_template partial: partial
    end
  end
end
