require "test_helper"

class PlotPointsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @plot_point = plot_points(:plot_point_1)
    @book = @plot_point.book
    @user = users(:users_1)
    sign_in @user
  end

  test "should get index" do
    get book_plot_points_url(@book)
    assert_response :success
  end

  test "should get new" do
    get new_book_plot_point_url(@book)
    assert_response :success
  end

  test "should create plot_point" do
    assert_difference('PlotPoint.count') do
      post book_plot_points_url(@book), params: { plot_point: { name: @plot_point.name, book_id: @book.id } }
    end

    assert_redirected_to book_plot_points_url(@book)
  end

  test "should show plot_point" do
    get plot_point_url(@plot_point)
    assert_response :success
  end

  test "should get edit" do
    get edit_plot_point_url(@plot_point)
    assert_response :success
  end

  test "should update plot_point" do
    patch plot_point_url(@plot_point), params: { plot_point: { name: @plot_point.name, book_id: @plot_point.book.id } }
    assert_redirected_to plot_point_url(@plot_point)
  end

  test "should destroy plot_point" do
    assert_difference('PlotPoint.count', -1) do
      delete plot_point_url(@plot_point)
    end

    assert_redirected_to book_plot_points_url(@book)
  end
end
