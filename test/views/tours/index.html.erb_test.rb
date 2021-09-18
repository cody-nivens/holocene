require 'test_helper'

class ToursIndexHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @tour= tours(:tour_1)
    @story = @tour.story

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get index' do
    get story_tours_url(@story)

    assert_response 200
    @tours = Tour.all

    assert_select "a[text()=?]",'New Tour'
    assert_select "a[href=?]", new_polymorphic_path([@story, :tour])
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", story_path(@story)
    assert_select ".footer>div>a", 2
    assert_template 'tours/index'

    assert_select 'h1',"Tours for #{@story.name}"

    ["layouts/_nav_links", "_nav_links", "layouts/_nav_links_for_auth", "_nav_links_for_auth",
     "application/_header", "_header", "layouts/_messages", "_messages", "application/_footer", "_footer"].each do |partial|
      assert_template partial: partial
    end
  end
end
