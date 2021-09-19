# frozen_string_literal: true

require 'test_helper'

class AsidesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @aside = asides(:aside_1)
    @chapter = @aside.chapter
    @chapter_3 = chapters(:chapter_3)
    @user = users(:users_1)
    sign_in @user
  end

  test 'should get index' do
    get chapter_asides_url(@chapter)
    assert_response :success
    assert_template 'asides/index'
  end

  test 'should get new' do
    get new_chapter_aside_url(@chapter)
    assert_response :success
    assert_template 'asides/new'
  end

  test 'should create aside' do
    assert_difference('Aside.count') do
      post chapter_asides_url(@chapter_3),
           params: { aside: { body: @aside.body, name: @aside.name }, chapter_id: @chapter_3.id }
    end

    assert_redirected_to chapter_url(@chapter_3)
    # assert_template 'asides/show'
  end

  test 'should not create aside' do
    assert_difference('Aside.count', 0) do
      post chapter_asides_url(@chapter),
           params: { aside: { body: @aside.body, name: @aside.name }, chapter_id: @chapter.id }
    end

    assert_response :success
    assert_template 'asides/new'
  end

  test 'should show aside' do
    get chapter_aside_url(@chapter, @aside)
    assert_response :success
    assert_template 'asides/show'
  end

  test 'should get edit' do
    get edit_chapter_aside_url(@chapter, @aside)
    assert_response :success
    assert_template 'asides/edit'
  end

  test 'should update aside' do
    patch chapter_aside_url(@chapter, @aside), params: { aside: { body: @aside.body, name: @aside.name } }
    assert_redirected_to chapter_url(@chapter)
    # assert_template 'asides/show'
  end

  test 'should not update aside' do
    patch chapter_aside_url(@chapter, @aside), params: { aside: { body: @aside.body, name: '' } }
    assert_response :success
    assert_template 'asides/edit'
  end

  test 'should destroy aside' do
    assert_difference('Aside.count', -1) do
      delete chapter_aside_url(@chapter, @aside)
    end

    assert_redirected_to chapter_url(@chapter)
    assert_template partial: false
  end
end
