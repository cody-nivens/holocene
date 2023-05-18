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

    assert_select "turbo-frame" do |elements|
      elements.each do |element|
        assert_equal element["target"], "edit-location"
        assert_equal element["id"], "new_locations"
      end
    end
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

    assert_select "turbo-frame" do |elements|
      elements.each do |element|
        assert_equal element["id"], (dom_id @location)
      end
    end
    assert_response :success
    assert_response :success
  end

  test "should update location" do
    patch location_url(@location), params: { location: { name: @location.name, book_id: @location.book.id } }
    assert_redirected_to location_url(@location)
  end

  test "should show location TS" do
    get location_url(@location, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "#{dom_id @location}"
    assert_response :success
  end

  test "should create location TS" do
    assert_difference('Location.count') do
      post book_locations_url(@book, format: 'turbo_stream'), params: { location: { name: "Test 1", book_id: @location.book.id } }
    end
    
    assert_no_turbo_stream action: :update, target: "messages"
    assert_turbo_stream action: :replace, target: "new_locations"
    assert_turbo_stream action: :replace, target: "edit_locations"
    assert_turbo_stream action: :replace, target: "locations"
    #assert_turbo_stream status: :created, action: :append, target: "messages" do |selected|
    #  assert_equal "<template>message_1</template>", selected.children.to_html
    #end
    assert_response :success
  end

  test "should update location TS" do
    patch location_url(@location, format: :turbo_stream), params: { location: { name: @location.name, book_id: @location.book.id } }
    label = dom_id @location
    assert_turbo_stream action: :replace, target: label do |selected|
      #assert_equal "<template></template>", selected.children.to_html
    end

    assert_no_turbo_stream action: :update, target: "messages"
    assert_turbo_stream action: :replace, target: "#{dom_id @location}"
    assert_response :success
  end

  test "should destroy location TS" do
    assert_difference('Location.count', -1) do
      delete location_url(@location, format: :turbo_stream)
    end

    assert_turbo_stream action: :replace, target: "locations"
    assert_response :success
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
