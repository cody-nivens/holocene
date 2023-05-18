require "test_helper"

class ActorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @actor = actors(:actor_1)
    @book = books(:book_2)
    @user = users(:users_1)
    sign_in @user
  end

  test "should get index" do
    get book_actors_url(@book)
    assert_response :success
  end

  test "should get new" do
    get new_book_actor_url(@book)

    assert_select "turbo-frame" do |elements|
      elements.each do |element|
        assert_equal element["target"], "edit-actor"
        assert_equal element["id"], "new_actors"
      end
    end
    assert_response :success
  end

  test "should create actor" do
    assert_difference('Actor.count') do
      post book_actors_url(@book), params: { actor: { name: @actor.name, book_id: @book.id } }
    end

    assert_redirected_to actor_url(Actor.last)
  end

  test "should not create actor" do
    assert_difference('Actor.count', 0) do
      post book_actors_url(@book), params: { actor: { name: '', book_id: @book.id } }
    end

    assert_response :unprocessable_entity
    assert_template :new
  end

  test "should show actor" do
    get actor_url(@actor)
    assert_response :success
  end

  test "should get edit" do
    get edit_actor_url(@actor)
    assert_response :success
  end

  test "should update actor" do
    patch actor_url(@actor), params: { actor: { name: @actor.name } }
    assert_redirected_to actor_url(@actor)
  end

  test "should not update actor" do
    patch actor_url(@actor), params: { actor: { name: nil } }

    assert_response :unprocessable_entity
    assert_template :edit
  end

  test "should destroy actor" do
    assert_difference('Actor.count', -1) do
      delete actor_url(@actor)
    end

    assert_redirected_to book_actors_url(@book)
  end

  test "should show actor TS" do
    get actor_url(@actor, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "#{dom_id @actor}"
    assert_response :success
  end

  test "should create actor TS" do
    assert_difference('Actor.count') do
      post book_actors_url(@book, format: 'turbo_stream'), params: { actor: { name: "Test 1", book_id: @actor.book.id } }
    end
    
    assert_no_turbo_stream action: :update, target: "messages"
    assert_turbo_stream action: :replace, target: "new_actors"
    assert_turbo_stream action: :replace, target: "edit_actors"
    assert_turbo_stream action: :replace, target: "actors"
    #assert_turbo_stream status: :created, action: :append, target: "messages" do |selected|
    #  assert_equal "<template>message_1</template>", selected.children.to_html
    #end
    assert_response :success
  end

  test "should update actor TS" do
    patch actor_url(@actor, format: :turbo_stream), params: { actor: { name: @actor.name, book_id: @actor.book.id } }
    label = dom_id @actor
    assert_turbo_stream action: :replace, target: label do |selected|
      #assert_equal "<template></template>", selected.children.to_html
    end

    assert_no_turbo_stream action: :update, target: "messages"
    assert_turbo_stream action: :replace, target: "#{dom_id @actor}"
    assert_response :success
  end

  test "should destroy actor TS" do
    assert_difference('Actor.count', -1) do
      delete actor_url(@actor, format: :turbo_stream)
    end

    assert_turbo_stream action: :replace, target: "actors"
    assert_response :success
  end

end
