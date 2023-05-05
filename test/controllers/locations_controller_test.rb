require "test_helper"

class LocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @location = locations(:location_1)
    @book = @location.book
    @user = users(:users_1)
    sign_in @user
  end

  test "should get index" do
    get book_locations_url(@book)
    assert_response :success
  end

  test "should get new" do
    get new_book_location_url(@book)
    assert_response :success
  end

  test "should create location" do
    assert_difference('Location.count') do
      post book_locations_url(@book), params: { location: { name: "Test 1", book_id: @location.book.id } }
    end

    assert_redirected_to location_url(Location.last)
  end

  test "should not create location" do
    assert_difference('Location.count', 0) do
      post book_locations_url(@book), params: { location: { name: "", book_id: @location.book.id } }
    end

    assert_response :unprocessable_entity
    assert_template :new
  end

  test "should show location" do
    get location_url(@location)
    assert_response :success
  end

  test "should get edit" do
    get edit_location_url(@location)
    assert_response :success
  end

  test "should update location" do
    patch location_url(@location), params: { location: { name: @location.name, book_id: @location.book.id } }
    assert_redirected_to location_url(@location)
  end

  test "should not update location" do
    patch location_url(@location), params: { location: { name: '', book_id: @location.book.id } }

    assert_response :unprocessable_entity
    assert_template :edit
  end

  test "should destroy location" do
    assert_difference('Location.count', -1) do
      delete location_url(@location)
    end

    assert_redirected_to book_locations_url(@book)
  end
end
