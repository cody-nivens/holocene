require "application_system_test_case"

class PartitionsTest < ApplicationSystemTestCase
  setup do
    @partition = partitions(:one)
  end

  test "visiting the index" do
    visit partitions_url
    assert_selector "h1", text: "Partitions"
  end

  test "creating a Partition" do
    visit partitions_url
    click_on "New Partition"

    fill_in "Body", with: @partition.body
    fill_in "Chapter", with: @partition.chapter_id
    fill_in "Name", with: @partition.name
    click_on "Create Partition"

    assert_text "Partition was successfully created"
    click_on "Back"
  end

  test "updating a Partition" do
    visit partitions_url
    click_on "Edit", match: :first

    fill_in "Body", with: @partition.body
    fill_in "Chapter", with: @partition.chapter_id
    fill_in "Name", with: @partition.name
    click_on "Update Partition"

    assert_text "Partition was successfully updated"
    click_on "Back"
  end

  test "destroying a Partition" do
    visit partitions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Partition was successfully destroyed"
  end
end
