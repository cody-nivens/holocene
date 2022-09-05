# frozen_string_literal: true

require 'test_helper'

class CharacterCategoriesIndexHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @character_category = character_categories(:character_category_1)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get index' do
    get character_categories_url

    assert_response 200
    @character_categories = CharacterCategory.all

    assert_select 'a[text()=?]', 'New Character Category'
    assert_select 'a[href=?]', new_character_category_path
    assert_select '.footer>div>a', 1
    assert_template 'character_categories/index'

    assert_select 'h2', 'Character Categories'

    ['layouts/_nav_links', '_nav_links', 'layouts/_nav_links_for_auth', '_nav_links_for_auth',
     'application/_header', '_header', 'layouts/_messages', '_messages', 'application/_footer', '_footer'].each do |partial|
      assert_template partial: partial
    end
  end
end
