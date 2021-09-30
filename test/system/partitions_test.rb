# frozen_string_literal: true

require 'application_system_test_case'

class PartitionsTest < ApplicationSystemTestCase
  setup do
    @partition = partitions(:partition_1)
    @book = books(:book_1)
    @chapter = chapters(:chapter_1)
    @user = users(:users_1)
    sign_in @user
  end

  test 'partitions edit' do
    visit edit_partition_url(@partition)
#    visit Show
    assert_link 'Show'
    click_on 'Show'
    assert_link 'Edit'
    assert_current_path partition_path(@partition)
    click_on 'Back'
    assert_link 'Partition'
    assert_current_path chapter_path(@chapter)
  end

  test 'partitions index' do
    visit chapter_partitions_url(@chapter)
#    visit New Partition
    assert_link 'New Partition'
    click_on 'New Partition'
    assert_no_link 'New Partition'
    assert_current_path new_chapter_partition_path(@chapter)
    click_on 'Back'
    assert_link 'Partition'
    assert_current_path chapter_path(@chapter)
  end

  test 'partitions show' do
    visit partition_url(@partition)
#    visit Edit
    assert_link 'Edit'
    click_on 'Edit'
    assert_link 'Show'
    assert_current_path edit_partition_path(@partition)
    click_on 'Back'
    assert_link 'Partition'
    assert_current_path chapter_path(@chapter)
  end

  test 'creating a Partition' do
    visit chapter_partitions_url(@chapter)
    click_on 'New Partition'

    fill_in 'Name', with: @partition.name
    fill_in_rich_text_area 'partition_body', with: 'Test 1'

    click_on 'Create Partition'

    assert_text 'Partition was successfully created'
    click_on 'Back'
  end

  test 'should not create a Partition' do
    visit chapter_partitions_url(@chapter)
    click_on 'New Partition'

    fill_in 'Name', with: ''
    fill_in_rich_text_area 'partition_body', with: 'Test 1'

    click_on 'Create Partition'

    assert_text "can't be blank"

    fill_in 'Name', with: @partition.name
    click_on 'Create Partition'

    assert_text 'Partition was successfully created'
    click_on 'Back'
  end
end
