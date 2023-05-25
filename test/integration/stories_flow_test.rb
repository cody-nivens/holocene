# frozen_string_literal: true

require 'test_helper'

class StoriesFlowTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:book_1)
    @key_point = key_points(:key_point_1)
    @scene = scenes(:scene_9)

    @user = users(:users_1)
    sign_in @user
  end

  if 1 == 0
  test 'creating a Story flow' do
    get new_book_story_url(book_id: @book.id)

    assert_difference('Story.count') do
      post book_stories_url(book_id: @book.id),
           params: { story: { book_id: @book.id, summary: 'Full of bright eyed enthusiasm',
                              title: 'Sammy goes to Washington' } }
    end

    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_template 'stories/show'

    assert_select '.alert', /.*Story was successfully created.*/
    assert_select 'h3', /Sammy goes to Washington/

    story = Story.last

    assert_difference('KeyPoint.count') do
      post polymorphic_url([story, :key_points]),
           params: { key_point: { scripted_id: story.id, scripted_type: story.class.name, climax: @key_point.climax,
                                  first_pinch_point: @key_point.first_pinch_point, first_plot_point: @key_point.first_plot_point, hook: @key_point.hook, inciting_incident: @key_point.inciting_incident, key_element: @key_point.key_element, midpoint: @key_point.midpoint, second_pinch_point: @key_point.second_pinch_point, third_plot_point: @key_point.third_plot_point } }
    end

    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_template 'key_points/show'

    key_point = KeyPoint.last

    assert_difference('Scene.count') do
      post polymorphic_url([story, :scenes]), params: { scene: { key_point_id: key_point.id, situated_type: story.class.name, situated_id: story.id, abc: @scene.abc, check: @scene.check, scene_sequel: @scene.scene_sequel, date_string: @scene.date_string, book_id: @scene.book_id },
                                                        t: { years: '99', month: '8', day: '23', hour: '8', minute: '23' } }
    end

    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_template 'scenes/show'
  end
end
end
