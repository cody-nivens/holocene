# frozen_string_literal: true

require 'test_helper'

class SectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @section = sections(:section_1)
    @section_2 = sections(:section_2)
    @sectioned_1 = @section.sectioned
    @sectioned_2 = @section_2.sectioned
    @scripted = @sectioned_1.scripted
    @user = users(:users_1)
    sign_in @user
  end

  test 'should get index' do
    get polymorphic_url([@sectioned_1, :sections])
    assert_response :success
  end

  test 'should get new' do
    get new_polymorphic_url([@sectioned_1, :section])
    assert_select "turbo-frame" do |elements|
      elements.each do |element|
        assert_equal element["target"], "edit-section"
        assert_equal element["id"], "new_sections"
      end
    end
    assert_response :success
  end

  test 'should get new 2' do
    get new_polymorphic_url([@sectioned_1, :section])
    assert_response :success
  end

  test 'should create section' do
    assert_difference('Metric.count') do
      assert_difference('Section.count') do
        post polymorphic_url([@sectioned_1, :sections]),
             params: { section: { body: @section.body, name: "#{@section.name}1", position: @section.position,
                                  sectioned_id: @sectioned_1.id, sectioned_type: 'Chapter', user_id: @user.id } }
      end
    end

    assert_redirected_to polymorphic_url(@sectioned_1)
  end

  test 'should create section 2' do
    assert_difference('Metric.count') do
      assert_difference('Section.count') do
        post polymorphic_url([@sectioned_2, :sections]),
             params: { section: { body: @section.body, sectioned_type: @sectioned_2.class.name, sectioned_id: @sectioned_2.id,
                                  name: "#{@section.name}1", position: @section.position, user_id: @user.id } }
      end
    end

    assert_redirected_to polymorphic_url(@sectioned_2)
  end

  test 'should not create section' do
    assert_difference('Section.count', 0) do
      post polymorphic_url([@sectioned_1, :sections]),
           params: { section: { sectioned_type: @sectioned_1.class.name, sectioned_id: @sectioned_1.id, body: @section.body,
                                name: '', position: @section.position, user_id: @user.id } }
    end

    assert_response :success
  end

  test 'should show section' do
    get section_url(@section)
    assert_response :success
  end

  test 'should map section' do
    get geo_map_section_url(@section)
    assert_response :success
  end

  test 'should add event for section' do
    get section_add_event_url(section_id: @section.id)
    assert_response :success
  end

  test 'should show section timeline' do
    get section_timeline_url(@section)
    assert_response :success
  end

  test 'should show section events' do
    get section_display_url(@section)
    assert_response :success
  end

  test 'should get edit' do
    get edit_section_url(@section)
    assert_select "turbo-frame" do |elements|
      elements.each do |element|
        assert_equal element["id"], (dom_id @section.sectioned)
      end
    end
    assert_response :success
  end

  test 'should get edit 2' do
    get edit_section_url(@section)
    assert_response :success
  end

  test 'should update section' do
    assert_difference('Metric.count', 0) do
      patch section_url(@section), params: { chapter_id: @sectioned_1.scripted.id, section: { body: @section.body, name: @section.name, position: @section.position,
                                                                                              sectioned_type: @sectioned_1.class.name, sectioned_id: @sectioned_1.id, user_id: @user.id } }
    end

    assert_redirected_to polymorphic_path(@sectioned_1)
  end

  test 'should update section 2' do
    assert_difference('Metric.count', 1) do
      patch section_url(@section_2), params: { scene_id: @sectioned_2.scripted.id, section: { body: @section_2.body, name: @section_2.name, position: @section_2.position,
                                                                                              sectioned_type: @sectioned_2.class.name, sectioned_id: @sectioned_2.id, user_id: @user.id } }
    end
    assert_redirected_to polymorphic_path(@sectioned_2)
  end

  test 'should update section 3' do
    assert_difference('Metric.count', 1) do
      patch section_url(@section_2), params: { chapter_id: @sectioned_2.scripted.id, section: { body: @section_2.body, name: @section_2.name, position: @section_2.position,
                                                                                                sectioned_type: @sectioned_1.class.name, sectioned_id: @sectioned_1.id, user_id: @user.id } }
    end

    assert_redirected_to polymorphic_path(@sectioned_1)
  end

  test 'should not update section' do
    patch section_url(@section), params: { chapter_id: @sectioned_1.scripted.id, section: { body: @section.body, name: '', position: @section.position,
                                                                                            sectioned_type: @sectioned_1.class.name, sectioned_id: @sectioned_1.id, user_id: @user.id } }
    assert_response :success
  end

  test 'should destroy section' do
    if ["0","1"].include?(ENV['PARALLEL_WORKERS'])
      ThinkingSphinx::Test.run do
        assert_difference('Section.count', -1) do
          delete section_url(@section)
        end
      end

      assert_redirected_to polymorphic_url(@sectioned_1)
    end
  end

  test 'should destroy section 2' do
    if ["0","1"].include?(ENV['PARALLEL_WORKERS'])
      ThinkingSphinx::Test.run do
        assert_difference('Section.count', -1) do
          delete section_url(@section)
        end
      end

      assert_redirected_to polymorphic_url(@sectioned_2)
    end
  end

  test "should show section TS" do
    get section_url(@section, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "#{dom_id @section}"
    assert_response :success
  end

  test "should create section TS" do
    assert_difference('Section.count') do
      post polymorphic_url([@sectioned_2, :sections], format: :turbo_stream),
             params: { section: { body: @section.body, sectioned_type: @sectioned_2.class.name, sectioned_id: @sectioned_2.id,
                                  name: "#{@section.name}1", position: @section.position, user_id: @user.id } }
    end
    
    assert_no_turbo_stream action: :update, target: "messages"
    assert_turbo_stream action: :replace, target: "new_sections"
    assert_turbo_stream action: :replace, target: "edit_sections"
    assert_turbo_stream action: :replace, target: "sections"
    #assert_turbo_stream status: :created, action: :append, target: "messages" do |selected|
    #  assert_equal "<template>message_1</template>", selected.children.to_html
    #end
    assert_response :success
  end

  test "should update section TS" do
    patch section_url(@section, format: :turbo_stream), params: { chapter_id: @sectioned_1.scripted.id, section: { body: @section.body, name: @section.name, position: @section.position,
                                                                                              sectioned_type: @sectioned_1.class.name, sectioned_id: @sectioned_1.id, user_id: @user.id } }
    label = dom_id @section
    assert_turbo_stream action: :replace, target: label

    assert_no_turbo_stream action: :update, target: "messages"
    assert_turbo_stream action: :replace, target: "#{dom_id @section}"
    assert_response :success
  end

  test "should destroy section TS" do
    assert_difference('Section.count', -1) do
      delete section_url(@section, format: :turbo_stream)
    end

    assert_turbo_stream action: :replace, target: "sections"
    assert_response :success
  end

end
