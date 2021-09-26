# frozen_string_literal: true

require 'test_helper'

class PartitionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @partition = partitions(:partition_1)
    @chapter = chapters(:chapter_1)
    @user = users(:users_1)
    sign_in @user
  end

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
