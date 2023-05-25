# frozen_string_literal: true

require 'test_helper'

class AuthorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @author_2 = authors(:author_2)
    @author = authors(:author_1)
    @author_3 = authors(:author_3)
    @user = users(:users_1)
    @book = @author_2.books[0]
    @book_2 = books(:book_2)
    sign_in @user
  end

  if 1 == 0
  test 'should get index' do
    get book_authors_path(@book)
    assert_response :success
  end

  test 'should add authors I' do
    assert_difference('@book.authors.count') do
      post book_authors_add_path(@book), params: { authors_ids: [], authors_avail: [@author_3.id] }
    end

    assert_redirected_to polymorphic_path([@book, :authors_list])
  end

  test 'should add authors II' do
    assert_difference('@book.authors.count') do
      post book_authors_add_path(@book), params: { authors_ids: [], authors_avail: [@author_3.id] }
    end

    assert_difference('@book.authors.count', -1) do
      post book_authors_add_path(@book), params: { authors_ids: [@author_3.id], authors_avail: [] }
    end

    assert_redirected_to polymorphic_path([@book, :authors_list])
  end

  test 'should add authors III' do
    assert_difference('@book.authors.count') do
      post book_authors_add_url(@book), params: { authors_ids: [], authors_avail: [@author_3.id] }
    end

    assert_difference('@book.authors.count', 0) do
      post book_authors_add_path(@book), params: { authors_ids: [], authors_avail: [@author_3.id] }
    end

    assert_redirected_to polymorphic_path([@book, :authors_list])
  end


  test 'should create author' do
    assert_difference('Author.count') do
      post book_authors_path(@book),
           params: { author: { first_name: @author.first_name, last_name: @author.last_name, user_id: @user.id } }
    end

    assert_redirected_to polymorphic_path([@book, Author.last])
  end

  test 'should not create author' do
    assert_difference('Author.count', 0) do
      post book_authors_path(@book),
           params: { author: { first_name: '', last_name: @author.last_name, user_id: @user.id } }
    end

    assert_response :success
    assert_template 'authors/new'
  end

  test 'should show author' do
    get polymorphic_path([@book, @author])
    assert_response :success
  end

  test 'should update author' do
    patch polymorphic_path([@book, @author]),
          params: { author: { first_name: @author.first_name, last_name: @author.last_name, user_id: @user.id } }
    assert_redirected_to polymorphic_path([@book, @author])
  end

  test 'should not update author' do
    patch polymorphic_path([@book, @author]),
          params: { author: { first_name: '', last_name: @author.last_name, user_id: @user.id } }
    assert_response :success
    assert_template 'authors/edit'
  end

  test 'should destroy author' do
    assert_difference('Author.count', -1) do
      delete polymorphic_path([@book, @author])
    end

    assert_redirected_to book_authors_path(@book)
  end
end

  test 'should get edit' do
    get edit_polymorphic_path([@book, @author])
    assert_response :success
  end

  test 'should get new' do
    get new_polymorphic_path([@book, :author])
    assert_select "turbo-frame", id:  "new_object", target: "edit"
    assert_response :success
  end

  test 'should show author TS 2' do
    get polymorphic_path([@book, @author], format: :turbo_stream)

    assert_select "turbo-frame", id:  "#{dom_id @author}"
    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end

  test 'should show author index TS' do
    get book_authors_url(@book, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end


  test "should show author TS" do
    get book_author_url(@book, @author, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_response :success
  end

  test "should create author TS" do
    assert_difference('Author.count') do
      post book_authors_path(@book, format: 'turbo_stream'),
           params: { author: { first_name: "Sam", last_name: "Mergle", user_id: @user.id } }
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

  test "should update author TS" do
    patch polymorphic_path([@book, @author], format: :turbo_stream),
          params: { author: { first_name: @author.first_name, last_name: @author.last_name, user_id: @user.id } }
    label = dom_id @author
    assert_turbo_stream action: :replace, target: label do |selected|
      #assert_equal "<template></template>", selected.children.to_html
    end

    assert_no_turbo_stream action: :update, target: "messages"
    assert_turbo_stream action: :replace, target: "#{dom_id @author}"
    assert_response :success
  end

  test "should destroy author TS" do
    assert_difference('Author.count', -1) do
      delete polymorphic_url([@book, @author], format: :turbo_stream)
    end

    assert_turbo_stream action: :replace, target: "objects"
    assert_response :success
  end

end
