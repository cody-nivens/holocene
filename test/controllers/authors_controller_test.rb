require 'test_helper'

class AuthorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @author = authors(:authors_1)
    @user = users(:users_1)
    sign_in @user
  end

  test "should get index" do
    get authors_url
    assert_response :success
  end

  test "should get new" do
    get new_author_url
    assert_response :success
  end

  test "should create author" do
    assert_difference('Author.count') do
        post authors_url, params: { author: { first_name: @author.first_name, last_name: @author.last_name, user_id: @user.id } }
    end

    assert_redirected_to author_url(Author.last)
  end

  test "should not create author" do
    assert_difference('Author.count', 0) do
        post authors_url, params: { author: { first_name: "", last_name: @author.last_name, user_id: @user.id } }
    end

    assert_response :success
  end

  test "should show author" do
    get author_url(@author)
    assert_response :success
  end

  test "should get edit" do
    get edit_author_url(@author)
    assert_response :success
  end

  test "should update author" do
      patch author_url(@author), params: { author: { first_name: @author.first_name, last_name: @author.last_name, user_id: @user.id } }
    assert_redirected_to author_url(@author)
  end

  test "should not update author" do
      patch author_url(@author), params: { author: { first_name: "", last_name: @author.last_name, user_id: @user.id } }
    assert_response :success
  end

  test "should destroy author" do
    assert_difference('Author.count', -1) do
      delete author_url(@author)
    end

    assert_redirected_to authors_url
  end
end
