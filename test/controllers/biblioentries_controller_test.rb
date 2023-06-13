# frozen_string_literal: true

require 'test_helper'

class BiblioentriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @biblioentry = biblioentries(:biblioentry_1)
    @book = @biblioentry.book
    # @book = books(:book_1)
    @user = users(:users_1)
    sign_in @user
  end

  if 1 == 0
  test 'should get index' do
    get book_biblioentries_url(@book)
    assert_response :success
  end

  test 'should get new' do
    get new_book_biblioentry_url(@book)
    assert_response :success
  end

  test 'should create biblioentry' do
    assert_difference('Biblioentry.count') do
      post book_biblioentries_url(@book),
           params: { biblioentry: { copyright_holder: @biblioentry.copyright_holder, copyright_year: @biblioentry.copyright_year,
                                    name: @biblioentry.name, publisher: @biblioentry.publisher, xreflabel: @biblioentry.xreflabel, user_id: @user.id, book_id: @book.id } }
    end

    assert_redirected_to biblioentry_url(Biblioentry.last)
  end

  test 'should not create biblioentry' do
    assert_difference('Biblioentry.count', 0) do
      post book_biblioentries_url(@book),
           params: { biblioentry: { copyright_holder: @biblioentry.copyright_holder, copyright_year: @biblioentry.copyright_year,
                                    name: '', publisher: @biblioentry.publisher, xreflabel: @biblioentry.xreflabel, user_id: @user.id, book_id: @book.id } }
    end

    assert_response :success
  end

  test 'should show biblioentry' do
    get biblioentry_url(@biblioentry)
    assert_response :success
  end

  test 'should get edit' do
    get edit_biblioentry_url(@biblioentry)
    assert_response :success
  end

  test 'should update biblioentry' do
    patch biblioentry_url(@biblioentry),
          params: { biblioentry: { copyright_holder: @biblioentry.copyright_holder, copyright_year: @biblioentry.copyright_year,
                                   name: @biblioentry.name, publisher: @biblioentry.publisher, xreflabel: @biblioentry.xreflabel } }
    assert_redirected_to biblioentry_url(@biblioentry)
  end

  test 'should not update biblioentry' do
    patch biblioentry_url(@biblioentry),
          params: { biblioentry: { copyright_holder: @biblioentry.copyright_holder, copyright_year: @biblioentry.copyright_year,
                                   name: '', publisher: @biblioentry.publisher, xreflabel: @biblioentry.xreflabel } }
    assert_response :success
  end

  test 'should destroy biblioentry' do
    assert_difference('Biblioentry.count', -1) do
      delete biblioentry_url(@biblioentry)
    end

    assert_redirected_to book_biblioentries_url(@book)
  end
end
  test 'should get edit' do
    get edit_biblioentry_path(@biblioentry)
    assert_select "turbo-frame", id:  "new_object"
    assert_response :success
  end

  test 'should get new' do
    get new_polymorphic_path([@book, :biblioentry])
    assert_select "turbo-frame", id:  "new_object"
    assert_response :success
  end

  test 'should show biblioentry TS' do
    get biblioentry_path(@biblioentry, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end

  test 'should show biblioentry index TS' do
    get book_biblioentries_url(@book, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end


  test "should create biblioentry TS" do
    assert_difference('Biblioentry.count') do
      post book_biblioentries_url(@book, format: 'turbo_stream'),
           params: { biblioentry: { copyright_holder: @biblioentry.copyright_holder, copyright_year: @biblioentry.copyright_year,
                                    name: @biblioentry.name, publisher: @biblioentry.publisher, xreflabel: @biblioentry.xreflabel, user_id: @user.id, book_id: @book.id } }
    end
    
    assert_no_turbo_stream action: :update, target: "messages"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "objects"
    #assert_turbo_stream status: :created, action: :append, target: "messages" do |selected|
    #  assert_equal "<template>message_1</template>", selected.children.to_html
    #end
    assert_response :success
  end

  test "should update biblioentry TS" do
    patch  biblioentry_path(@biblioentry, format: :turbo_stream),
          params: { biblioentry: { copyright_holder: @biblioentry.copyright_holder, copyright_year: @biblioentry.copyright_year,
                                   name: @biblioentry.name, publisher: @biblioentry.publisher, xreflabel: @biblioentry.xreflabel } }
    assert_turbo_stream action: :replace, target: "#{dom_id @biblioentry}"

    assert_no_turbo_stream action: :update, target: "messages"
    assert_response :success
  end

  test "should destroy biblioentry TS" do
    assert_difference('Biblioentry.count', -1) do
      delete biblioentry_url(@biblioentry, format: :turbo_stream)
    end

    assert_turbo_stream action: :replace, target: "objects"
    assert_response :success
  end
end
