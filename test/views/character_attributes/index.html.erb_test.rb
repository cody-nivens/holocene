require 'test_helper'

class CharacterAttributesIndexHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @character_attribute= character_attributes(:character_attribute_1)
    @character_category = @character_attribute.character_category

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get index' do
    get polymorphic_path([@character_category,:character_attributes])

    assert_response 200
    @character_attributes = CharacterAttribute.all

    assert_select "a[text()=?]",'New Character Attribute'
    assert_select "a[href=?]", new_polymorphic_path([@character_category, :character_attribute])
    assert_select ".footer>div>a", 2
    assert_template 'character_attributes/index'

    assert_select 'h1','Character Attributes'

    ["layouts/_nav_links", "_nav_links", "layouts/_nav_links_for_auth", "_nav_links_for_auth",
     "application/_header", "_header", "layouts/_messages", "_messages", "application/_footer", "_footer"].each do |partial|
      assert_template partial: partial
    end
  end
end
