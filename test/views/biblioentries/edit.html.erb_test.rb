require 'test_helper'

class BiblioentriesEditHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @biblioentry= biblioentries(:biblioentry_1)
    @book = @biblioentry.book

    @user = users(:users_1)
    sign_in @user
  end

  test "should get edit" do
    get edit_biblioentry_url(@biblioentry)
    assert_select "a[text()=?]",'Back'
    assert_response :success

    assert_select "a[text()=?]",'Show'
    assert_select "a[href=?]", biblioentry_path(@biblioentry)
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", polymorphic_path([@book, :biblioentries])
    assert_select ".footer>div>a", 2
    assert_template 'biblioentries/edit'
  end
end
