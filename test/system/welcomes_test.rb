# frozen_string_literal: true

require 'application_system_test_case'

class WelcomesTest < ApplicationSystemTestCase
  setup do
    @user = users(:users_1)
    sign_in @user
  end

  test 'visiting the Welcome index' do
    visit root_url
    assert_link 'Events'
    assert_link 'Stats'
    click_on 'Stats'
    assert_link 'Progress'
    assert_current_path welcome_stats_path
    assert_link 'Tags'
    click_on 'Tags'
    assert_link 'Progress'
    assert_current_path welcome_tags_path
  end

  test 'visiting the Welcome stats' do
    visit welcome_stats_url
    assert_link 'Events'
    assert_link 'Progress'
    click_on 'Progress'
    assert_link 'Tags'
    assert_current_path welcome_index_path
    assert_link 'Tags'
    click_on 'Tags'
    assert_link 'Progress'
    assert_current_path welcome_tags_path
  end

  test 'visiting the Welcome tags' do
    visit welcome_tags_url
    assert_link 'Progress'
    click_on 'Progress'
    assert_link 'Tags'
    assert_current_path welcome_index_path
    assert_link 'Stats'
    click_on 'Stats'
    assert_link 'Tags'
    assert_current_path welcome_stats_path
    assert_link 'Tags'
    click_on 'Tags'
    assert_link 'Progress'
    assert_current_path welcome_tags_path
  end
end
