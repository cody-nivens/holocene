require 'test_helper'

class PartitionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @partition = partitions(:partition_1)
    @chapter = chapters(:chapter_1)
    @book = books(:book_1)
    @user = users(:users_1)
    sign_in @user
  end

  test "should get index" do
    get book_chapter_partitions_url(@book,@chapter)
    assert_response :success
  end

  test "should get new" do
    get new_book_chapter_partition_url(@book,@chapter)
    assert_response :success
  end

  test "should create partition" do
    assert_difference('Partition.count') do
      post book_chapter_partitions_url(@book,@chapter), params: { partition: { body: @partition.body, chapter_id: @partition.chapter_id, name: @partition.name } }
    end

    assert_redirected_to book_chapter_partition_url(@book,@chapter,Partition.last)
  end

  test "should not create partition" do
    assert_difference('Partition.count',0) do
      post book_chapter_partitions_url(@book,@chapter), params: { partition: { body: @partition.body, chapter_id: @partition.chapter_id, name: ''} }
    end

    assert_response :success
  end

  test "should show partition" do
    get book_chapter_partition_url(@book,@chapter,@partition)
    assert_response :success

    assert_select "a[text()=?]",'Edit'
    assert_select "a[href=?]", edit_book_chapter_partition_path(@partition.chapter.book,@partition.chapter,@partition)
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", book_chapter_path(@chapter.book,@chapter)
    assert_select ".footer>div>a", 2
  end

  test "should get edit" do
    get edit_book_chapter_partition_url(@book,@chapter,@partition)
  end

  test "should update partition" do
    patch book_chapter_partition_url(@book,@chapter,@partition), params: { partition: { body: @partition.body, chapter_id: @partition.chapter_id, name: @partition.name } }
    assert_redirected_to book_chapter_partition_url(@book,@chapter,@partition)
  end

  test "should not update partition" do
    patch book_chapter_partition_url(@book,@chapter,@partition), params: { partition: { body: @partition.body, chapter_id: @partition.chapter_id, name: ''} }
    assert_response :success
  end

  test "should destroy partition" do
    assert_difference('Partition.count', -1) do
      delete book_chapter_partition_url(@book,@chapter,@partition)
    end

    assert_redirected_to book_chapter_partitions_url(@book,@chapter)
  end
end
