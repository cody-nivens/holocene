require "test_helper"

class ActsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @act = acts(:act_1)
    @book = @act.book
    @user = users(:users_1)
    sign_in @user
  end

  test "should get index" do
    get book_acts_url(@book)
    assert_response :success
  end

  test "should get new" do
    get new_book_act_url(@book)
    assert_response :success
  end

  test "should create act" do
    assert_difference('Act.count') do
      post book_acts_url(@book), params: { act: { book_id: @act.book_id, name: @act.name } }
    end

    assert_redirected_to act_url(Act.last)
  end

  test "should show act" do
    get act_url(@act)
    assert_response :success
  end

  test "should get edit" do
    get edit_act_url(@act)
    assert_response :success
  end

  test "should update act" do
    patch act_url(@act), params: { act: { book_id: @act.book_id, name: @act.name } }
    assert_redirected_to act_url(@act)
  end

  test "should destroy act" do
    assert_difference('Act.count', -1) do
      delete act_url(@act)
    end

    assert_redirected_to book_acts_url(@book)
  end
end
