require 'test_helper'

class ItinerariesShowHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @itinerary= itineraries(:itinerary_1)
    @tour = @itinerary.tour

    @user = users(:users_1)
    sign_in @user
  end

  test "should show itinerary" do
    get itinerary_path(@itinerary)
    assert_response :success

    assert_select "a[text()=?]",'Edit'
    assert_select "a[href=?]", edit_itinerary_path(@itinerary)
    assert_select "a[text()=?]",'Back'
    assert_select ".footer>div>a", 2
    assert_template 'itineraries/show'
  end
end
