require 'test_helper'

class PartitionsNewHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @partition= partitions(:partition_1)
    @chapter = @partition.chapter

    @user = users(:users_1)
    sign_in @user
  end

  test "should get new" do
    get new_polymorphic_url([@chapter, :partition])
    assert_response :success

    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", chapter_path(@chapter)
    assert_select ".footer>div>a", 1
    assert_template 'partitions/new'
  end
end
