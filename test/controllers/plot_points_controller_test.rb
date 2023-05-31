require "test_helper"

class PlotPointsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @plot_point = plot_points(:plot_point_1)
    @book = @plot_point.book
    @scene = scenes(:scene_1)
    @user = users(:users_1)
    sign_in @user
  end

  if 1 == 0
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
      post book_plot_points_url(@book), 
        params: { plot_point: { name: @plot_point.name, book_id: @book.id } }
    end

    assert_redirected_to book_plot_points_url(@book)
  end

  test "should not create plot_point" do
    assert_difference('PlotPoint.count', 0) do
      post book_plot_points_url(@book), params: { plot_point: { name: '', book_id: @book.id } }
    end

    assert_response :unprocessable_entity
    assert_template :new
  end

  test "should show plot_point" do
    get plot_point_url(@plot_point)
    assert_response :success
  end

  test "should add plot_point" do
    post plot_points_add_url(@plot_point), params: { scenes_avail: [@scene.id], scenes_ids: [@scene.id] }
    assert_redirected_to plot_points_list_url(@plot_point)
  end

  test "should get edit" do
    get edit_plot_point_url(@plot_point)
    assert_response :success
  end

  test "should update plot_point" do
    patch plot_point_url(@plot_point),
      params: { plot_point: { name: @plot_point.name, book_id: @plot_point.book.id } }
    assert_redirected_to plot_point_url(@plot_point)
  end

  test "should not update plot_point" do
    patch plot_point_url(@plot_point), params: { plot_point: { name: '', book_id: @plot_point.book.id } }
    assert_response :unprocessable_entity
    assert_template :edit
  end

  test "should destroy plot_point" do
    assert_difference('PlotPoint.count', -1) do
      delete plot_point_url(@plot_point)
    end

    assert_redirected_to book_plot_points_url(@book)
  end
end
  test 'should get edit' do
    get edit_plot_point_path(@plot_point)
    assert_select "turbo-frame", id:  "new_object"
    assert_response :success
  end

  test 'should get new' do
    get new_polymorphic_path([@book, :plot_point])
    assert_select "turbo-frame", id:  "new_object", target: "edit"
    assert_response :success
  end

  test 'should show plot_point TS' do
    get plot_point_path(@plot_point, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end

  test 'should show plot_point index TS' do
    get book_plot_points_url(@book, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end


  test "should create plot_point TS" do
    assert_difference('PlotPoint.count') do
      post book_plot_points_url(@book, format: 'turbo_stream'),
        params: { plot_point: { name: @plot_point.name, book_id: @book.id } }
    end
    
    assert_no_turbo_stream action: :update, target: "messages"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "edit"
    assert_turbo_stream action: :replace, target: "objects"
    #assert_turbo_stream status: :created, action: :append, target: "messages" do |selected|
    #  assert_equal "<template>message_1</template>", selected.children.to_html
    #end
    assert_response :success
  end

  test "should update plot_point TS" do
    patch  plot_point_path(@plot_point, format: :turbo_stream),
      params: { plot_point: { name: @plot_point.name, book_id: @plot_point.book.id } }
    assert_turbo_stream action: :replace, target: "#{dom_id @plot_point}"

    assert_no_turbo_stream action: :update, target: "messages"
    assert_response :success
  end

  test "should destroy plot_point TS" do
    assert_difference('PlotPoint.count', -1) do
      delete plot_point_url(@plot_point, format: :turbo_stream)
    end

    assert_turbo_stream action: :replace, target: "objects"
    assert_response :success
  end
end
