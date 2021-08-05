require "application_system_test_case"

class PartitionsTest < ApplicationSystemTestCase
  setup do
    @partition = partitions(:partition_1)
    @book = books(:book_1)
    @chapter = chapters(:chapter_1)
    @user = users(:users_1)
    sign_in @user
  end

  test "creating a Partition" do
    visit chapter_partitions_url(@chapter)
    click_on "New Partition"

    fill_in "Name", with: @partition.name
    fill_in_rich_text_area "partition_body", with: "Test 1"

    click_on "Create Partition"

    assert_text "Partition was successfully created"
    click_on "Back"
  end

  test "should not create a Partition" do
    visit chapter_partitions_url(@chapter)
    click_on "New Partition"

    fill_in "Name", with: ""
    fill_in_rich_text_area "partition_body", with: "Test 1"

    click_on "Create Partition"

    assert_text "can't be blank"

    fill_in "Name", with: @partition.name
    click_on "Create Partition"

    assert_text "Partition was successfully created"
    click_on "Back"
  end
end
