require 'test_helper'

class EpochesNewHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @epoch= epochs(:epoch_1)

    @user = users(:users_1)
    sign_in @user
  end

  test "should get new" do
    get new_epoch_url
    assert_response :success

    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", epochs_path
    assert_select ".footer>div>a", 1
    assert_template 'epochs/new'
  end
end
