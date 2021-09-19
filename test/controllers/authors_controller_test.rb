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

  test 'should get new' do
    get new_polymorphic_path([@book, :author])
    assert_response :success
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

  test 'should get edit' do
    get edit_polymorphic_path([@book, @author])
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
