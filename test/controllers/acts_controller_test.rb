require "test_helper"

class ActsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @act = acts(:act_1)
    @book = @act.book
    @user = users(:users_1)
    sign_in @user
  end

  if 1 == 0
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

  test "should not create act" do
    assert_difference('Act.count', 0) do
      post book_acts_url(@book), params: { act: { book_id: @act.book_id, name: '' } }
    end

    assert_response :unprocessable_entity
    assert_template :new
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

  test "should not update act" do
    patch act_url(@act), params: { act: { book_id: @act.book_id, name: '' } }

    assert_response :unprocessable_entity
    assert_template :edit
  end

  test "should destroy act" do
    assert_difference('Act.count', -1) do
      delete act_url(@act)
    end

    assert_redirected_to book_acts_url(@book)
  end
end
  test 'should get edit' do
    get edit_act_url(@act)
    assert_select "turbo-frame", id:  "new_object"
    assert_response :success
  end

  test 'should get new' do
    get new_book_act_url(@book)
    assert_select "turbo-frame", id:  "new_object"
    assert_response :success
  end

  test 'should show act TS' do
    get act_url(@act, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end

  test 'should show act index TS' do
    get book_acts_url(@book, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end


  test "should create act TS" do
    assert_difference('Act.count') do
      post book_acts_url(@book, format: 'turbo_stream'), params: { act: { name: "Test 1", book_id: @act.book.id } }
    end
    
    assert_no_turbo_stream action: :update, target: "messages"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "objects"
    #assert_turbo_stream status: :created, action: :append, target: "messages" do |selected|
    #  assert_equal "<template>message_1</template>", selected.children.to_html
    #end
    assert_response :success
  end

  test "should update act TS" do
    patch act_url(@act, format: :turbo_stream), params: { act: { name: @act.name, book_id: @act.book.id } }
    assert_turbo_stream action: :replace, target: "objects"

    assert_no_turbo_stream action: :update, target: "messages"
    assert_response :success
  end

  test "should destroy act TS" do
    assert_difference('Act.count', -1) do
      delete act_url(@act, format: :turbo_stream)
    end

    assert_turbo_stream action: :replace, target: "objects"
    assert_response :success
  end
end
