require 'test_helper'

class SignetsEditHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @signet= signets(:signet_1)
    @sigged = @signet.sigged

    @user = users(:users_1)
    sign_in @user
  end

  test "should get edit" do
    get edit_signet_url("#{@sigged.class.name.underscore}_id".to_sym => @sigged.id, :id => @signet.id)
    assert_response :success

    assert_select "a[text()=?]",'Show'
    assert_select "a[href=?]", polymorphic_path([@sigged, @signet])
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", polymorphic_path(@sigged)
    assert_select ".footer>div>a", 2
    assert_template 'signets/edit'
  end
end
