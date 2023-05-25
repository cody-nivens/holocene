# frozen_string_literal: true

require 'test_helper'

class ScenesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scene = scenes(:scene_1)
    @scene_2 = scenes(:scene_2)
    @scene_3 = scenes(:scene_3)
    @scene_6 = scenes(:scene_6)

    @book = books(:book_1)
    @book_2 = books(:book_2)

    @key_point = @scene.key_point
    @key_point_2 = key_points(:key_point_2)

    @situated = @scene.situated
    @situated_2 = @scene_2.situated
    @situated_3 = @scene_3.situated
    @situated_6 = @scene_6.situated

    @user = users(:users_1)
    sign_in @user
  end

  if 1 == 0
  test 'should sort scenes' do
    patch scene_sort_url(scene_id: @scene_2.id), xhr: true,
                                               params: { scene: { id: @scene_2.id, key_point_id: @scene_2.key_point_id } }
    assert_response :success
  end

  test 'should check scene' do
    checked = @scene_2.check

    put scene_check_path(id: @scene_2.id), xhr: true,
                                               params: { check: !checked }
    assert_response :success
    assert_equal !checked, @scene_2.reload.check
  end

  test 'should get index' do
    get polymorphic_url([@situated, :scenes]), params: { button_action: "Reset Checked", low_wc: 1200, mid_wc: 2400, better_wc: 3400 }

    assert_response :success
  end

  test 'should get move' do
    get polymorphic_url([@scene, :move])

    assert_response :success
  end

  test 'should move scene' do
    [[1, 2], [2, 3], [3, 4], [4, 5], [5, 6], [6, 1]].each do |x, y|
      post polymorphic_url([@scene, :moved]),
        params: { new_key_point_id: @key_point_2.id, new_selector: y, selector: x, story_id: @scene.situated.id }

      assert_response :redirect
      assert_redirected_to polymorphic_url(@scene)
    end
  end

  test 'should get index 2' do
    get polymorphic_url([@situated, :scenes], toggle: 'on')

    assert_response :success
  end

  test 'should get index 3' do
    get polymorphic_url([@book_2, :scenes])

    assert_response :success
  end

  test 'should get index 4' do
    get polymorphic_url([@book_2, :scenes])

    assert_response :success
  end

  test 'should get index 5' do
    get polymorphic_url([@situated_2, :scenes])

    assert_response :success
  end

  test 'should create scene' do
    assert_difference('Scene.count') do
      post polymorphic_url([@situated, :scenes]), params: { scene: { key_point_id: @scene.key_point.id, situated_type: @situated.class.name, situated_id: @situated.id, 
                                                                     abc: @scene.abc, artifact_id: nil, check: @scene.check, scene_sequel: @scene.scene_sequel, 
                                                                     date_string: @scene.date_string, book_id: @scene.book_id },
                                                            t: { t_years: '99', t_month: '8', t_day: '23', t_hour: '8', t_minute: '23' } }
    end

    assert_redirected_to scene_url(Scene.last)
  end

  test 'should not create scene' do
    assert_difference('Scene.count', 0) do
      post polymorphic_url([@situated, :scenes]), params: { scene: { situated_type: @situated.class.name, situated_id: @situated.id, abc: '',
                                                                     check: @scene.check, scene_sequel: @scene.scene_sequel, date_string: '',
                                                                     book_id: @scene.book_id, key_point_id: @scene.key_point.id },
                                                            t: { t_years: '99', t_month: '8', t_day: '23', t_hour: '8', t_minute: '23' } }
    end

    assert_response :success
  end

  test 'should show scene' do
    get scene_url(@scene)
    ids = ["#{dom_id @scene}", "#{dom_id @scene.section}", "new_object", "objects"]
    @scene.characters.each do |child|
      child.character_scenes.each do |cs|
        ids << "#{dom_id cs}"
      end
    end

    assert_select "turbo-frame" do |elements|
      elements.each do |element|
        assert_includes ids, element["id"]
      end
    end
    assert_response :success
  end

  test 'should show scene 2' do
    get scene_url(@scene_2)

    assert_response :success
  end

  test 'should show scene 3' do
    get scene_url(@scene_3)

    assert_response :success
  end

  test 'should show scene 4' do
    get scene_url(@scene_6)

    assert_response :success
  end

  test 'should update scene' do
    patch scene_url(@scene), params: { scene: { abc: @scene.abc, check: @scene.check, scene_sequel: @scene.scene_sequel, date_string: @scene.date_string },
                                       t: { t_years: '', t_month: '', t_day: '' } }
    assert_redirected_to scene_url(@scene)
  end

  test 'should not update scene' do
    patch scene_url(@scene), params: { scene: { abc: '', check: @scene.check, scene_sequel: @scene.scene_sequel, date_string: @scene.date_string },
                                       t: { t_years: '1', t_month: '1', t_day: '1' } }
    assert_response :success
  end

  test 'should destroy scene' do
    if ["0","1"].include?(ENV['PARALLEL_WORKERS'])
      ThinkingSphinx::Test.run do
        assert_difference('Scene.count', -1) do
          delete scene_url(@scene)
        end
      end

      assert_redirected_to polymorphic_url([@situated, :scenes])
    end
  end
end

  test 'should get edit' do
    get edit_scene_url(@scene)
    assert_response :success
  end

  test 'should get new' do
    get new_polymorphic_url([@situated, :scene])
    assert_select "turbo-frame", id:  "new_object", target: "edit"
    assert_response :success
  end

  test 'should show scene TS' do
    get scene_url(@scene, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end

  test 'should show scene index TS' do
    get polymorphic_url([@situated, :scenes], format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end


  test "should create scene TS" do
    assert_difference('Scene.count') do
      post polymorphic_url([@situated, :scenes], format: :turbo_stream), params: { scene: { key_point_id: @scene.key_point.id, situated_type: @situated.class.name, situated_id: @situated.id, 
                                                                     abc: @scene.abc, artifact_id: nil, check: @scene.check, scene_sequel: @scene.scene_sequel, 
                                                                     date_string: @scene.date_string, book_id: @scene.book_id },
                                                            t: { t_years: '0099', t_month: '02', t_day: '15', t_hour: '08', t_minute: '30' } }
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

  test "should update scene TS" do
    patch scene_url(@scene, format: :turbo_stream), params: { scene: { abc: @scene.abc, check: @scene.check, scene_sequel: @scene.scene_sequel, date_string: @scene.date_string },
                                                                       t: { t_years: '0099', t_month: '02', t_day: '15', t_hour: '08', t_minute: '30' },
                                                              session: { book_id: @scene.book.id } }

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"
    assert_no_turbo_stream action: :update, target: "messages"
    assert_response :success
  end

  test "should destroy scene TS" do
    assert_difference('Scene.count', -1) do
      delete scene_url(@scene, format: :turbo_stream)
    end

    assert_turbo_stream action: :replace, target: "objects"
    assert_response :success
  end

end
