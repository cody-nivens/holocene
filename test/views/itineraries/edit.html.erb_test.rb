require 'test_helper'

class ItinerariesEditHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @itinerary= itineraries(:itinerary_1)
    @tour = @itinerary.tour

    @user = users(:users_1)
    sign_in @user
  end

  test "should get edit" do
    get edit_itinerary_url(@itinerary)
    assert_select "a[text()=?]",'Back'
    assert_response :success

    assert_select "a[text()=?]",'Show'
    assert_select "a[href=?]", itinerary_path(@itinerary)
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", tour_path(@tour)
    assert_select ".footer>div>a", 2
    assert_template 'itineraries/edit'
  end
end
