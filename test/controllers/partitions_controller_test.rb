require 'test_helper'

class PartitionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @partition = partitions(:one)
  end

  test "should get index" do
    get partitions_url
    assert_response :success
  end

  test "should get new" do
    get new_partition_url
    assert_response :success
  end

  test "should create partition" do
    assert_difference('Partition.count') do
      post partitions_url, params: { partition: { body: @partition.body, chapter_id: @partition.chapter_id, name: @partition.name } }
    end

    assert_redirected_to partition_url(Partition.last)
  end

  test "should show partition" do
    get partition_url(@partition)
    assert_response :success
  end

  test "should get edit" do
    get edit_partition_url(@partition)
    assert_response :success
  end

  test "should update partition" do
    patch partition_url(@partition), params: { partition: { body: @partition.body, chapter_id: @partition.chapter_id, name: @partition.name } }
    assert_redirected_to partition_url(@partition)
  end

  test "should destroy partition" do
    assert_difference('Partition.count', -1) do
      delete partition_url(@partition)
    end

    assert_redirected_to partitions_url
  end
end
