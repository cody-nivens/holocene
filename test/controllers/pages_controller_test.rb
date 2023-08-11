require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @page = pages(:page_1)
    @user = users(:users_1)
    sign_in @user
  end

  test 'should get edit' do
    get edit_page_path(@page)
    assert_select "turbo-frame", id:  "new_object"
    assert_response :success
  end

  test 'should get new' do
    get new_page_path(@story)
    assert_select "turbo-frame", id:  "new_object"
    assert_response :success
  end

  test 'should show page TS' do
    get page_path(@page, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end

  test 'should view page TS' do
    get page_view_path('about', format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end

  test 'should show page index TS' do
    get pages_url(@story, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end

  test "should create page TS" do
    assert_difference('Page.count') do
      post pages_url(@story, format: 'turbo_stream'),
        params: { page: { name: "Test 1", user_id: @user.id, slug: "test_1", body: "This the time for all good me to rise to the occation." } }
    end
    
    assert_no_turbo_stream action: :update, target: "messages"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "objects"
    assert_response :success
  end

  test "should update page TS" do
    patch  page_path(@page, format: :turbo_stream),
      params: { page: { name: @page.name, user_id: @user.id, slug: "help", body: @page.body } }
    assert_turbo_stream action: :replace, target: "#{dom_id @page}"

    assert_no_turbo_stream action: :update, target: "messages"
    assert_response :success
  end

  test "should destroy page TS" do
    assert_difference('Page.count', -1) do
      delete page_url(@page, format: :turbo_stream)
    end

    assert_turbo_stream action: :replace, target: "objects"
    assert_response :success
  end
end
