require "application_system_test_case"

class PartitionsTest < ApplicationSystemTestCase
  setup do
    @partition = partitions(:partition_1)
    @book = books(:book_1)
    @chapter = chapters(:chapter_1)
    @user = users(:users_1)
    sign_in @user
  end

  test "visiting the index" do
    visit chapter_partitions_url(@chapter)
    assert_selector "h1", text: "Partitions"
  end

  test "creating a Partition" do
    visit chapter_partitions_url(@chapter)
    click_on "New Partition"

    fill_in "Name", with: @partition.name
    page.execute_script("var wysihtml5Editor = $('#partition_body').data('wysihtml5').editor;wysihtml5Editor.setValue('#{@partition.body}\[\[test99\]\]')")

    click_on "Create Partition"

    assert_text "Partition was successfully created"
    click_on "Back"
  end

  test "should not create a Partition" do
    visit chapter_partitions_url(@chapter)
    click_on "New Partition"

    fill_in "Name", with: ""
    page.execute_script("var wysihtml5Editor = $('#partition_body').data('wysihtml5').editor;wysihtml5Editor.setValue('#{@partition.body}\[\[test99\]\]')")

    click_on "Create Partition"

    assert_text "can't be blank"

    fill_in "Name", with: @partition.name
    click_on "Create Partition"

    assert_text "Partition was successfully created"
    click_on "Back"
  end

  test "updating a Partition" do
    visit chapter_partition_url(@chapter,@partition)
    click_on "Edit", match: :first

    fill_in "Name", with: @partition.name
    page.execute_script("var wysihtml5Editor = $('#partition_body').data('wysihtml5').editor;wysihtml5Editor.setValue('#{@partition.body}\[\[test99\]\]')")
    click_on "Update Partition"

    assert_text "Partition was successfully updated"
    click_on "Back"
  end

  test "should not update a Partition" do
    visit chapter_partition_url(@chapter,@partition)
    click_on "Edit", match: :first

    fill_in "Name", with: ""
    page.execute_script("var wysihtml5Editor = $('#partition_body').data('wysihtml5').editor;wysihtml5Editor.setValue('#{@partition.body}\[\[test99\]\]')")
    click_on "Update Partition"
    assert_text "can't be blank"

    fill_in "Name", with: @partition.name
    click_on "Update Partition"
    assert_text "Partition was successfully updated"
    click_on "Back"
  end

  test "destroying a Partition" do
    visit chapter_partitions_url(@chapter)
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Partition was successfully destroyed"
  end
end
