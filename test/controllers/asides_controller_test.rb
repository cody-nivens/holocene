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

  if 1 == 0
  test 'should get index' do
    get chapter_asides_url(@chapter)
    assert_response :success
    assert_template 'asides/index'
  end

  test 'should create aside' do
    assert_difference('Aside.count') do
      post chapter_asides_url(@chapter_3),
           params: { aside: { body: @aside.body, name: @aside.name, chapter_id: @chapter_3.id } }
    end

    assert_redirected_to chapter_url(@chapter_3)
    # assert_template 'asides/show'
  end

  test 'should not create aside' do
    assert_difference('Aside.count', 0) do
      post chapter_asides_url(@chapter),
           params: { aside: { body: @aside.body, name: '', chapter_id: @chapter.id } }
    end

    assert_response :success
    assert_template 'asides/new'
  end

  test 'should show aside' do
    get aside_url(@aside)

    assert_select "turbo-frame" do |elements|
      elements.each do |element|
        assert_equal element["id"], (dom_id @aside)
      end
    end
    assert_response :success
    assert_template 'asides/show'
  end


  test 'should update aside' do
    patch aside_url(@aside), params: { aside: { body: @aside.body, name: @aside.name } }
    assert_redirected_to chapter_url(@chapter)
    # assert_template 'asides/show'
  end

  test 'should not update aside' do
    patch aside_url(@aside), params: { aside: { body: @aside.body, name: '' } }
    assert_response :success
    assert_template 'asides/edit'
  end

  test 'should destroy aside' do
    assert_difference('Aside.count', -1) do
      delete aside_url(@aside)
    end

    assert_redirected_to chapter_url(@chapter)
    assert_template partial: false
  end
  end


  test 'should get edit' do
    get edit_aside_url(@aside)
    assert_response :success
  end

  test 'should get new' do
    get new_chapter_aside_url(@chapter)
    assert_select "turbo-frame", id:  "new_object", target: "edit"
    assert_response :success
  end

  test 'should show aside TS' do
    get aside_url(@aside, format: :turbo_stream)

    assert_select "turbo-frame", id:  "#{dom_id @aside}"
    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end

  test 'should show aside index TS' do
    get chapter_asides_url(@chapter, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end


  test "should create aside TS" do
    assert_difference('Aside.count') do
      post chapter_asides_url(@chapter_3, format: 'turbo_stream'), params: { aside: { name: "Test 1", chapter_id: @chapter_3.id } }
    end
    
    assert_no_turbo_stream action: :update, target: "messages"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "edit"
    assert_turbo_stream action: :replace, target: "objects"
    #assert_turbo_stream status: :created, action: :append, target: "messages" do |selected|
    #  assert_equal "<template>message_1</template>", selected.children.to_html
    #end
    assert_response :success
  end

  test "should update aside TS" do
    patch aside_url(@aside, format: :turbo_stream), params: { aside: { name: @aside.name, chapter_id: @aside.chapter.id } }
    label = dom_id @aside
    assert_turbo_stream action: :replace, target: label do |selected|
      #assert_equal "<template></template>", selected.children.to_html
    end

    assert_no_turbo_stream action: :update, target: "messages"
    assert_turbo_stream action: :replace, target: "#{dom_id @aside}"
    assert_response :success
  end

  test "should destroy aside TS" do
    assert_difference('Aside.count', -1) do
      delete aside_url(@aside, format: :turbo_stream)
    end

    assert_turbo_stream action: :replace, target: "objects"
    assert_response :success
  end

end
