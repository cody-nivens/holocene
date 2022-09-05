# frozen_string_literal: true

require 'test_helper'

class PartitionsIndexHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @partition = partitions(:partition_1)
    @chapter = @partition.chapter

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get index' do
    get chapter_partitions_url(chapter_id: @chapter.id)

    assert_response 200
    @partitions = Partition.all

    assert_select 'a[text()=?]', 'New Partition'
    assert_select 'a[href=?]', new_polymorphic_path([@chapter, :partition])
    assert_select '.footer>div>a', 2
    assert_template 'partitions/index'

    assert_select 'h2', 'Partitions'

    ['layouts/_nav_links', '_nav_links', 'layouts/_nav_links_for_auth', '_nav_links_for_auth',
     'application/_header', '_header', 'layouts/_messages', '_messages', 'application/_footer', '_footer'].each do |partial|
      assert_template partial: partial
    end
  end
end
