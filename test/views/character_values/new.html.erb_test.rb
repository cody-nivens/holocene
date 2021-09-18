require 'test_helper'

class CharacterValuesNewHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @character_value= character_values(:character_value_1)
    @character = @character_value.character

    @user = users(:users_1)
    sign_in @user
  end

  test "should get new" do
    get new_polymorphic_url([@character, :character_value])
    assert_response :success

    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", character_character_values_path(@character)
    assert_select ".footer>div>a", 1
    assert_template 'character_values/new'
  end
end
