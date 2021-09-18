require 'test_helper'

class RegionsIndexHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @region= regions(:Africa)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get index' do
    get regions_url

    assert_response 200
    @regions = Region.all

    assert_select "a[text()=?]",'New Region'
    assert_select "a[href=?]", new_region_path
    assert_select ".footer>div>a", 1
    assert_template 'regions/index'

    assert_select 'h1','Regions'

    ["layouts/_nav_links", "_nav_links", "layouts/_nav_links_for_auth", "_nav_links_for_auth",
     "application/_header", "_header", "layouts/_messages", "_messages", "application/_footer", "_footer"].each do |partial|
      assert_template partial: partial
    end
  end
end
