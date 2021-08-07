require 'test_helper'

class SectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @section = sections(:section_1)
    @section_2 = sections(:section_2)
    @sectioned_1 = chapters(:chapter_1)
    @sectioned_2 = scenes(:scene_1)
    @scripted = @sectioned_1.scripted
    @user = users(:users_1)
    sign_in @user
  end

  test "should get index" do
    get polymorphic_url([@sectioned_1,:sections])
    assert_response :success

    assert_select "a[text()=?]",'New Section'
    assert_select "a[href=?]", new_polymorphic_path([@sectioned_1, :section])
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", polymorphic_path(@section.sectioned)
    assert_select ".footer>div>a", 2
  end

  test "should get new" do
    get new_polymorphic_url([@sectioned_1,:section])
    assert_response :success

    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", polymorphic_path([@section.sectioned, :sections])
    assert_select ".footer>div>a", 1
  end

  test "should get new 2" do
    get new_polymorphic_url([@sectioned_1,:section])
    assert_response :success

    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", polymorphic_path([@section.sectioned, :sections])
    assert_select ".footer>div>a", 1
  end

  test "should create section" do
    assert_difference('Metric.count') do
      assert_difference('Section.count') do
        post polymorphic_url([@sectioned_1, :sections]), params: {section: { body: @section.body, name: "#{@section.name}1", position: @section.position, sectioned_id: @sectioned_1.id, :sectioned_type => 'Chapter' } }
      end
    end

    assert_redirected_to polymorphic_url([@sectioned_1, Section.last])
  end

  test "should create section 2" do
    assert_difference('Metric.count') do
      assert_difference('Section.count') do
        post polymorphic_url([@sectioned_2, :sections]), params: {section: { body: @section.body,:sectioned_type => @sectioned_2.class.name, :sectioned_id => @sectioned_2.id,  name: "#{@section.name}1", position: @section.position } }
      end
    end

    assert_redirected_to polymorphic_url([@sectioned_2, Section.last])
  end

  test "should not create section" do
    assert_difference('Section.count', 0) do
      post polymorphic_url([@sectioned_1, :sections]), params: {section: {:sectioned_type => @sectioned_1.class.name, :sectioned_id => @sectioned_1.id,  body: @section.body, name: "", position: @section.position } }
    end

    assert_response :success
  end

  test "should show section" do
    get polymorphic_url([@sectioned_1,@section])
    assert_response :success

    assert_select "a[text()=?]",'Footnotes'
    assert_select "a[href=?]", section_footnotes_path(@section)
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", polymorphic_path(@section.sectioned)
    assert_select ".footer>div>a", 7
  end

  test "should map section" do
    get geo_map_section_url(@section)
    assert_response :success
  end

  test "should add event for section" do
      get section_add_event_url(:section_id => @section.id)
    assert_response :success
  end

  test "should show section timeline" do
    get section_timeline_url(@section)
    assert_response :success

    assert_select "a[text()=?]",'Display'
    assert_select "a[href=?]", timeline_display_path(@section)
    assert_select "a[text()=?]",'Back'
    #assert_select "a[href=?]", back_path
    assert_select ".footer>div>a", 2
  end

  test "should show section events" do
    get section_display_url(@section)
    assert_response :success

    assert_select "a[text()=?]",'Timeline'
    assert_select "a[href=?]", section_timeline_path(@section)
    assert_select "a[text()=?]",'Map'
    assert_select "a[href=?]", geo_map_section_path(@section)
    assert_select "a[text()=?]",'Back'
    #assert_select "a[href=?]", back_path
    assert_select ".footer>div>a", 3
  end

  test "should get edit" do
    get edit_polymorphic_url([@sectioned_1,@section])
    assert_response :success

    assert_select "a[text()=?]",'Show'
    assert_select "a[href=?]", polymorphic_path([@sectioned_1,@section])
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", polymorphic_path(@section.sectioned)
    assert_select ".footer>div>a", 2
  end

  test "should get edit 2" do
    get edit_polymorphic_url([@sectioned_1, @section])
    assert_response :success

    assert_select "a[text()=?]",'Show'
    assert_select "a[href=?]", polymorphic_path([@sectioned_1, @section])
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", polymorphic_path(@sectioned_1)
    assert_select ".footer>div>a", 2
  end

  test "should update section" do
    assert_difference('Metric.count') do
      patch polymorphic_url([@sectioned_1, @section]), params: { chapter_id: @sectioned_1.id,  section: { body: @section.body, name: @section.name, position: @section.position, :sectioned_type => @sectioned_1.class.name, :sectioned_id => @sectioned_1.id } }
    end

    assert_redirected_to polymorphic_path([@sectioned_1, @section])
  end

  test "should update section 2" do
    patch polymorphic_url([@sectioned_2, @section]), params: { scene_id: @sectioned_2.id, section: { body: @section.body, name: @section.name, position: @section.position, sectioned_type: @sectioned_2.class.name, sectioned_id: @sectioned_2.id } }
      assert_redirected_to polymorphic_path([@sectioned_2, @section])
  end

  test "should update section 3" do
    assert_difference('Metric.count', 0) do
      patch polymorphic_url([@sectioned_1, @section_2]), params: { chapter_id: @sectioned_1.id,  section: { body: @section_2.body, name: @section_2.name, position: @section_2.position, :sectioned_type => @sectioned_1.class.name, :sectioned_id => @sectioned_1.id } }
    end

    assert_redirected_to polymorphic_path([@sectioned_1, @section_2])
  end

  test "should not update section" do
    patch polymorphic_url([@sectioned_1, @section]), params: { chapter_id: @sectioned_1.id, section: { body: @section.body, name: "", position: @section.position, :sectioned_type => @sectioned_1.class.name, :sectioned_id => @sectioned_1.id } }
      assert_response :success
  end

  test "should destroy section" do
    assert_difference('Section.count', -1) do
      delete polymorphic_url([@sectioned_1, @section])
    end

    assert_redirected_to polymorphic_url(@sectioned_1)
  end

  test "should destroy section 2" do
    assert_difference('Section.count', -1) do
      delete polymorphic_url([@sectioned_2, @section])
    end

    assert_redirected_to polymorphic_url(@sectioned_2)
  end
end
