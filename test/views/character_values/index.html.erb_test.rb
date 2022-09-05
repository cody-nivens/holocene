# frozen_string_literal: true

require 'test_helper'

class CharacterValuesIndexHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @character_value = character_values(:character_value_1)
    @character = @character_value.character
    @book = books(:book_2)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get index' do
    get book_character_character_values_url(@book, @character)

    assert_response 200
    @character_values = CharacterValue.all

    assert_select 'a[text()=?]', 'New Character Value'
    assert_select 'a[href=?]', new_polymorphic_path([@book, @character, :character_value])
    assert_select 'a[text()=?]', 'Back'
    assert_select 'a[href=?]', book_character_path(@book, @character)
    assert_select '.footer>div>a', 2
    assert_template 'character_values/index'

    assert_select 'h2', 'Character Values'

    ['layouts/_nav_links', '_nav_links', 'layouts/_nav_links_for_auth', '_nav_links_for_auth',
     'application/_header', '_header', 'layouts/_messages', '_messages', 'application/_footer', '_footer'].each do |partial|
      assert_template partial: partial
    end
  end
end
