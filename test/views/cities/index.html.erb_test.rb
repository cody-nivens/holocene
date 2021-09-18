require 'test_helper'

class CitiesIndexHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @city= cities(:city_1)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get index' do
    get cities_url

    assert_response 200
    @cities = City.all

    assert_select "a[text()=?]",'New City'
    assert_select "a[href=?]", new_city_path
    assert_select ".footer>div>a", 1
    assert_template 'cities/index'

    assert_select 'h1','Cities'

    ["layouts/_nav_links", "_nav_links", "layouts/_nav_links_for_auth", "_nav_links_for_auth",
     "application/_header", "_header", "layouts/_messages", "_messages", "application/_footer", "_footer"].each do |partial|
      assert_template partial: partial
    end
  end
end
