# frozen_string_literal: true

require 'test_helper'

class PartitionsEditHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @partition = partitions(:partition_1)
    @chapter = @partition.chapter

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get edit' do
    get edit_partition_url(@partition)
    assert_select 'a[text()=?]', 'Back'
    assert_response :success

    assert_select 'a[text()=?]', 'Show'
    assert_select 'a[href=?]', partition_path(@partition)
    assert_select 'a[text()=?]', 'Back'
    assert_select 'a[href=?]', chapter_path(@chapter)
    assert_select '.footer>div>a', 2
    assert_template 'partitions/edit'
  end
end
