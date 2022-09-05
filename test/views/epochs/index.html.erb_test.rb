# frozen_string_literal: true

require 'test_helper'

class EpochsIndexHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @epoch = epochs(:epoch_1)

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get index' do
    get epochs_url

    assert_response 200
    @epoches = Epoch.all

    assert_select 'a[text()=?]', 'New Epoch'
    assert_select 'a[href=?]', new_epoch_path
    assert_select '.footer>div>a', 1
    assert_template 'epochs/index'

    assert_select 'h2', 'Epochs'

    ['layouts/_nav_links', '_nav_links', 'layouts/_nav_links_for_auth', '_nav_links_for_auth',
     'application/_header', '_header', 'layouts/_messages', '_messages', 'application/_footer', '_footer'].each do |partial|
      assert_template partial: partial
    end
  end
end
