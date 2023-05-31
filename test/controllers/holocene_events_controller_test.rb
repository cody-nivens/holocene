# frozen_string_literal: true

require 'test_helper'

class HoloceneEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @holocene_event = holocene_events(:holocene_event_1)
    @chapter = chapters(:chapter_1)
    @timeline = timelines(:timeline_1)
    @user = users(:users_1)
    sign_in @user
  end

  if 1 == 0
  test 'should get index' do
    get holocene_events_url
    assert_response :success
  end

  test 'should get index 2' do
    get holocene_events_url params: { holocene_events_grid: { name: 'Dog' } }
    assert_response :success
  end

  test 'should get index 3' do
    get holocene_events_url params: { holocene_events_grid: { event_type: EventType.first } }
    assert_response :success
  end

  test 'should show holocene_event timeline' do
    get timeline_timeline_url(timeline_id: @timeline.id)
    assert_response :success
  end

  test 'should get tagged 1' do
    get tag_url(tag: 'Domestication')
    assert_response :success
  end

  test 'should get tagged 2' do
    get tag_url
    assert_response :success
  end

  test 'should get new' do
    get new_holocene_event_url
    assert_response :success
  end

  test 'should create holocene_event' do
    assert_difference('HoloceneEvent.count') do
      post holocene_events_url,
           params: { holocene_event: { body: @holocene_event.body, end_year: @holocene_event.end_year,
                                       end_year_mod: @holocene_event.end_year_mod, end_year_uncert: @holocene_event.end_year_uncert,
                                       event_types: [@holocene_event.event_types], name: @holocene_event.name, region_id: @holocene_event.region.id.to_i,
                                       start_year: @holocene_event.start_year, start_year_mod: @holocene_event.start_year_mod,
                                       start_year_uncert: @holocene_event.start_year_uncert, user_id: @user.id } }
    end

    assert_redirected_to holocene_event_url(HoloceneEvent.last)
  end

  test 'should not create holocene_event' do
    assert_difference('HoloceneEvent.count', 0) do
      post holocene_events_url,
           params: { holocene_event: { body: @holocene_event.body, end_year: @holocene_event.end_year,
                                       end_year_mod: @holocene_event.end_year_mod, end_year_uncert: @holocene_event.end_year_uncert, event_types: [@holocene_event.event_types], name: '', region_id: @holocene_event.region.id.to_i, start_year: @holocene_event.start_year, start_year_mod: @holocene_event.start_year_mod, start_year_uncert: @holocene_event.start_year_uncert, user_id: @user.id } }
    end

    assert_response :success
  end

  test 'should show holocene_event' do
    get holocene_event_url(@holocene_event)
    assert_response :success
  end

  test 'should map holocene_event' do
    get geo_map_holocene_event_url(@holocene_event)
    assert_response :success
  end

  test 'should get add_event I' do
    get chapter_add_event_url(@chapter)
    assert_response :success
  end

  test 'should get add_event II' do
    user = users(:users_2)
    sign_in user
    get chapter_add_event_url(@chapter)
    assert_response :success
  end

  test 'should get edit' do
    get edit_holocene_event_url(@holocene_event)
    assert_response :success
  end

  test 'should update holocene_event' do
    patch holocene_event_url(@holocene_event),
          params: { holocene_event: { body: @holocene_event.body, end_year: @holocene_event.end_year,
                                      end_year_mod: @holocene_event.end_year_mod, end_year_uncert: @holocene_event.end_year_uncert,
                                      event_types: [@holocene_event.event_types], name: @holocene_event.name, region: @holocene_event.region,
                                      start_year: @holocene_event.start_year, start_year_mod: @holocene_event.start_year_mod,
                                      start_year_uncert: @holocene_event.start_year_uncert, user_id: @user.id } }
    assert_redirected_to holocene_event_url(@holocene_event)
  end

  test 'should not update holocene_event' do
    patch holocene_event_url(@holocene_event),
          params: { holocene_event: { body: @holocene_event.body, end_year: @holocene_event.end_year,
                                      end_year_mod: @holocene_event.end_year_mod, end_year_uncert: @holocene_event.end_year_uncert, event_types: [@holocene_event.event_types], name: '', region: @holocene_event.region, start_year: @holocene_event.start_year, start_year_mod: @holocene_event.start_year_mod, start_year_uncert: @holocene_event.start_year_uncert, user_id: @user.id } }
    assert_response :success
  end

  test 'should destroy holocene_event' do
    assert_difference('HoloceneEvent.count', -1) do
      delete holocene_event_url(@holocene_event)
    end

    assert_redirected_to holocene_events_url
  end

  test 'should add holocene_event to chapter' do
    @chapter = chapters(:chapter_3)
    post chapter_holocene_event_url(@chapter), params: {
      commit: 'Add Events',
      holocene_event: {
        object_id: @chapter.id,
        object_type: 'Chapter',
        activated: [@holocene_event.id],
        seen: [],
        body: @holocene_event.body,
        end_year: @holocene_event.end_year,
        end_year_mod: @holocene_event.end_year_mod,
        end_year_uncert: @holocene_event.end_year_uncert,
        event_types: @holocene_event.event_types,
        name: @holocene_event.name,
        region: @holocene_event.region,
        start_year: @holocene_event.start_year,
        start_year_mod: @holocene_event.start_year_mod,
        start_year_uncert: @holocene_event.start_year_uncert,
        user_id: @user.id
      }
    }
    assert_redirected_to show_chapter_url(@chapter)
  end

  test 'should add holocene_event to section' do
    @section = sections(:section_1)
    post section_holocene_event_url(@section), params: {
      commit: 'Add Events',
      holocene_event: {
        object_id: @section.id,
        object_type: 'Section',
        activated: [@holocene_event.id],
        seen: [],
        body: @holocene_event.body,
        end_year: @holocene_event.end_year,
        end_year_mod: @holocene_event.end_year_mod,
        end_year_uncert: @holocene_event.end_year_uncert,
        event_types: @holocene_event.event_types,
        name: @holocene_event.name,
        region: @holocene_event.region,
        start_year: @holocene_event.start_year,
        start_year_mod: @holocene_event.start_year_mod,
        start_year_uncert: @holocene_event.start_year_uncert,
        user_id: @user.id
      }
    }
    assert_redirected_to show_section_url(@section)
  end

  test 'should add holocene_event to timeline' do
    @timeline = timelines(:timeline_1)
    post timeline_holocene_event_url(@timeline), params: {
      commit: 'Add Events',
      holocene_event: {
        object_id: @timeline.id,
        object_type: 'Timeline',
        activated: [@holocene_event.id],
        seen: [],
        body: @holocene_event.body,
        end_year: @holocene_event.end_year,
        end_year_mod: @holocene_event.end_year_mod,
        end_year_uncert: @holocene_event.end_year_uncert,
        event_types: @holocene_event.event_types,
        name: @holocene_event.name,
        region: @holocene_event.region,
        start_year: @holocene_event.start_year,
        start_year_mod: @holocene_event.start_year_mod,
        start_year_uncert: @holocene_event.start_year_uncert,
        user_id: @user.id
      }
    }
    assert_redirected_to show_timeline_url(@timeline)
  end

  test 'should delete holocene_event' do
    @chapter = chapters(:chapter_1)
    post chapter_holocene_event_url(@chapter), params: {
      commit: 'Delete Events',
      holocene_event: {
        object_id: @chapter.id,
        object_type: 'Chapter',
        activated: [@holocene_event.id],
        seen: [],
        other_id: '',
        body: @holocene_event.body,
        end_year: @holocene_event.end_year,
        end_year_mod: @holocene_event.end_year_mod,
        end_year_uncert: @holocene_event.end_year_uncert,
        event_types: @holocene_event.event_types,
        name: @holocene_event.name,
        region: @holocene_event.region,
        start_year: @holocene_event.start_year,
        start_year_mod: @holocene_event.start_year_mod,
        start_year_uncert: @holocene_event.start_year_uncert,
        user_id: @user.id
      }
    }
    assert_redirected_to show_chapter_url(@chapter)
  end

  test 'should move chapter holocene_event' do
    @chapter = chapters(:chapter_1)
    post chapter_holocene_event_url(@chapter), params: {
      commit: 'Move Events',
      holocene_event: {
        object_id: @chapter.id,
        object_type: 'Chapter',
        activated: [@holocene_event.id],
        seen: [],
        other_id: @chapter.sections.last.id,
        body: @holocene_event.body,
        end_year: @holocene_event.end_year,
        end_year_mod: @holocene_event.end_year_mod,
        end_year_uncert: @holocene_event.end_year_uncert,
        event_types: @holocene_event.event_types,
        name: @holocene_event.name,
        region: @holocene_event.region,
        start_year: @holocene_event.start_year,
        start_year_mod: @holocene_event.start_year_mod,
        start_year_uncert: @holocene_event.start_year_uncert,
        user_id: @user.id
      }
    }
    assert_redirected_to show_chapter_url(@chapter)
  end

  test 'should move section holocene_event another section' do
    @chapter = chapters(:chapter_1)
    @section = @chapter.sections[0]
    post section_holocene_event_url(section_id: @section.id), params: {
      commit: 'Move Events',

      holocene_event: {
        object_id: @section.id,
        object_type: 'Section',
        activated: [@holocene_event.id],
        seen: [],
        other_id: @chapter.sections.last.id,
        body: @holocene_event.body,
        end_year: @holocene_event.end_year,
        end_year_mod: @holocene_event.end_year_mod,
        end_year_uncert: @holocene_event.end_year_uncert,
        event_types: @holocene_event.event_types,
        name: @holocene_event.name,
        region: @holocene_event.region,
        start_year: @holocene_event.start_year,
        start_year_mod: @holocene_event.start_year_mod,
        start_year_uncert: @holocene_event.start_year_uncert,
        user_id: @user.id
      }
    }
    assert_redirected_to show_section_url(@section)
  end

  test 'should move section holocene_event to chapter' do
    @chapter = chapters(:chapter_1)
    @section = @chapter.sections[0]
    post section_holocene_event_url(section_id: @section.id), params: {
      commit: 'Delete Events',

      holocene_event: {
        object_id: @section.id,
        object_type: 'Section',
        activated: [@holocene_event.id],
        seen: [],
        other_id: '',
        body: @holocene_event.body,
        end_year: @holocene_event.end_year,
        end_year_mod: @holocene_event.end_year_mod,
        end_year_uncert: @holocene_event.end_year_uncert,
        event_types: @holocene_event.event_types,
        name: @holocene_event.name,
        region: @holocene_event.region,
        start_year: @holocene_event.start_year,
        start_year_mod: @holocene_event.start_year_mod,
        start_year_uncert: @holocene_event.start_year_uncert,
        user_id: @user.id
      }
    }
    assert_redirected_to show_section_url(@section)
  end
end
  test 'should get edit' do
    get edit_polymorphic_path([@book, @holocene_event])
    assert_select "turbo-frame", id:  "new_object"
    assert_response :success
  end

  test 'should get new' do
    get new_holocene_event_path
    assert_select "turbo-frame", id:  "new_object", target: "edit"
    assert_response :success
  end

  test 'should show holocene_event TS' do
    get holocene_event_path(@holocene_event, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end

  test 'should show holocene_event index TS' do
    get holocene_events_url(format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end


  test "should create holocene_event TS" do
    assert_difference('HoloceneEvent.count') do
      post holocene_events_url(format: 'turbo_stream'),
           params: { holocene_event: { body: @holocene_event.body, end_year: @holocene_event.end_year,
                                       end_year_mod: @holocene_event.end_year_mod, end_year_uncert: @holocene_event.end_year_uncert,
                                       event_types: [@holocene_event.event_types], name: @holocene_event.name, region_id: @holocene_event.region.id.to_i,
                                       start_year: @holocene_event.start_year, start_year_mod: @holocene_event.start_year_mod,
                                       start_year_uncert: @holocene_event.start_year_uncert, user_id: @user.id } }
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

  test "should update holocene_event TS" do
    patch  holocene_event_path(@holocene_event, format: :turbo_stream),
          params: { holocene_event: { body: @holocene_event.body, end_year: @holocene_event.end_year,
                                      end_year_mod: @holocene_event.end_year_mod, end_year_uncert: @holocene_event.end_year_uncert,
                                      event_types: [@holocene_event.event_types], name: @holocene_event.name, region: @holocene_event.region,
                                      start_year: @holocene_event.start_year, start_year_mod: @holocene_event.start_year_mod,
                                      start_year_uncert: @holocene_event.start_year_uncert, user_id: @user.id } }

    assert_no_turbo_stream action: :update, target: "messages"
    assert_response :success
  end

  test "should destroy holocene_event TS" do
    assert_difference('HoloceneEvent.count', -1) do
      delete holocene_event_url(@holocene_event, format: :turbo_stream)
    end

    assert_turbo_stream action: :replace, target: "objects"
    assert_response :success
  end
end
