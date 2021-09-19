# frozen_string_literal: true

require 'test_helper'

class ToursNewHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @tour = tours(:tour_1)
    @story = @tour.story

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get new' do
    get new_polymorphic_url([@story, :tour])
    assert_response :success

    assert_select 'a[text()=?]', 'Back'
    assert_select 'a[href=?]', story_tours_path(@story)
    assert_select '.footer>div>a', 1
    assert_template 'tours/new'
  end
end
