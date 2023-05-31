# frozen_string_literal: true

require 'test_helper'

class PartitionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @partition = partitions(:partition_1)
    @chapter = chapters(:chapter_1)
    @user = users(:users_1)
    sign_in @user
  end

  if 1 == 0
  test 'should get index' do
    get chapter_partitions_url(@chapter)
    assert_response :success
  end

  test 'should get new' do
    get new_chapter_partition_url(@chapter)
    assert_response :success
  end

  test 'should create partition' do
    assert_difference('Partition.count') do
      post chapter_partitions_url(@chapter),
           params: { partition: { body: @partition.body, chapter_id: @partition.chapter_id, name: @partition.name } }
    end

    assert_redirected_to partition_url(Partition.last)
  end

  test 'should not create partition' do
    assert_difference('Partition.count', 0) do
      post chapter_partitions_url(@chapter),
           params: { partition: { body: @partition.body, chapter_id: @partition.chapter_id, name: '' } }
    end

    assert_response :success
  end

  test 'should show partition' do
    get partition_url(@partition)
    assert_response :success
  end

  test 'should get edit' do
    get edit_partition_url(@partition)
  end

  test 'should update partition' do
    patch partition_url(@partition),
          params: { partition: { body: @partition.body, chapter_id: @partition.chapter_id, name: @partition.name } }
    assert_redirected_to partition_url(@partition)
  end

  test 'should not update partition' do
    patch partition_url(@partition),
          params: { partition: { body: @partition.body, chapter_id: @partition.chapter_id, name: '' } }
    assert_response :success
  end

  test 'should destroy partition' do
    assert_difference('Partition.count', -1) do
      delete partition_url(@partition)
    end

    assert_redirected_to chapter_partitions_url(@chapter)
  end
end

  test 'should get edit' do
    get edit_partition_path(@partition)
    assert_select "turbo-frame", id:  "new_object"
    assert_response :success
  end

  test 'should get new' do
    get new_polymorphic_path([@chapter, :partition])
    assert_select "turbo-frame", id:  "new_object", target: "edit"
    assert_response :success
  end

  test 'should show partition TS' do
    get partition_path(@partition, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end

  test 'should show partition index TS' do
    get chapter_partitions_url(@chapter, format: :turbo_stream)

    assert_turbo_stream action: :replace, target: "objects"
    assert_turbo_stream action: :replace, target: "nav-bar"
    assert_turbo_stream action: :replace, target: "new_object"
    assert_turbo_stream action: :replace, target: "header"
    assert_turbo_stream action: :replace, target: "side_controls"

    assert_response :success
  end


  test "should create partition TS" do
    assert_difference('Partition.count') do
      post chapter_partitions_url(@chapter, format: 'turbo_stream'),
           params: { partition: { body: @partition.body, chapter_id: @partition.chapter_id, name: @partition.name } }
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

  test "should update partition TS" do
    patch partition_url(@partition, format: :turbo_stream),
          params: { partition: { body: @partition.body, chapter_id: @partition.chapter_id, name: @partition.name } }
    assert_turbo_stream action: :replace, target: "#{dom_id @partition}"

    assert_no_turbo_stream action: :update, target: "messages"
    assert_response :success
  end

  test "should destroy partition TS" do
    assert_difference('Partition.count', -1) do
      delete partition_url(@partition, format: :turbo_stream)
    end

    assert_turbo_stream action: :replace, target: "objects"
    assert_response :success
  end
end
