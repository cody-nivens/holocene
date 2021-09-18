require 'test_helper'

class CharacterValuesIndexHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @character_value = character_values(:character_value_1)
    @character = @character_value.character

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get index' do
    get character_character_values_url(:character_id => @character.id)

    assert_response 200
    @character_values = CharacterValue.all

    assert_select "a[text()=?]",'New Character Value'
    assert_select "a[href=?]", new_polymorphic_path([@character, :character_value])
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", character_path(@character)
    assert_select ".footer>div>a", 2
    assert_template 'character_values/index'

    assert_select 'h1','Character Values'

    ["layouts/_nav_links", "_nav_links", "layouts/_nav_links_for_auth", "_nav_links_for_auth",
     "application/_header", "_header", "layouts/_messages", "_messages", "application/_footer", "_footer"].each do |partial|
      assert_template partial: partial
    end
  end
end
