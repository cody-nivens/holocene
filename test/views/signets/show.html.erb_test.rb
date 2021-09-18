require 'test_helper'

class SignetsShowHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @signet= signets(:signet_1)
    @sigged = @signet.sigged

    @user = users(:users_1)
    sign_in @user
  end

  test "should show signet" do
    get polymorphic_path([@sigged, @signet])
    assert_response :success

    assert_select "a[text()=?]",'Edit'
    assert_select "a[href=?]", edit_signet_path("#{@sigged.class.name.underscore}_id".to_sym => @sigged.id, :id => @signet.id)
    assert_select "a[text()=?]",'Back'
    assert_select ".footer>div>a", 2
    assert_template 'signets/show'
  end
end
