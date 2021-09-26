# frozen_string_literal: true

require 'application_system_test_case'

class AuthorsTest < ApplicationSystemTestCase
  setup do
    @author = authors(:author_1)
    @book = @author.books[0]
    @user = users(:users_1)
    sign_in @user
  end
  test 'authors edit' do
#    visit Show
    visit edit_book_author_url(@book, @author)
    assert_text 'Show'
    click_on 'Show'
    assert_current_path polymorphic_path([@book, @author])
    click_on 'Back'
    assert_current_path book_path(@book)
  end

  test 'authors index' do
#    visit Add Author
    visit book_authors_url(@book)
    assert_text 'Add Author'
    click_on 'Add Author'
    assert_current_path polymorphic_path([@book, :authors_list])
    click_on 'Back'
    assert_current_path book_authors_path(@book)
#    visit New Author
    assert_text 'New Author'
    click_on 'New Author'
    assert_current_path new_polymorphic_path([@book, :author])
    click_on 'Back'
    assert_current_path book_authors_path(@book)
  end

  test 'authors list' do
#    visit New Author
    visit polymorphic_path([@book, :authors_list])
    assert_text 'New Author'
    click_on 'New Author'
    assert_current_path new_polymorphic_path([@book, :author])
    click_on 'Back'
    assert_current_path polymorphic_path([@book, :authors])
  end

  test 'authors show' do
#    visit Edit
    visit book_author_url(@book, @author)
    assert_text 'Edit'
    click_on 'Edit'
    assert_current_path edit_polymorphic_path([@book, @author])
    click_on 'Back'
    assert_current_path book_authors_path(@book)
  end


  test 'Adding an Author' do
    visit book_authors_url(@book)
    assert_selector 'h1', text: 'Authors'
    assert_link 'New Author'
    click_on 'Add Author'
    select 'M. Kariil', from: 'authors_avail'
    click_on 'Save'
    within '#authors_ids' do
      assert_text 'M. Kariil'
    end
    select 'M. Kariil', from: 'authors_ids'
    click_on 'Save'
    within '#authors_ids' do
      assert_no_text 'M. Kariil'
    end
  end

  test 'creating an Author' do
    visit book_authors_url(@book)
    click_on 'New Author'

    fill_in 'First name', with: @author.first_name
    fill_in 'Last name', with: @author.last_name
    click_on 'Create Author'

    assert_text 'Author was successfully created'
    click_on 'Back'
  end

  test 'should not create an Author' do
    visit book_authors_url(@book)
    click_on 'New Author'

    fill_in 'First name', with: ''
    fill_in 'Last name', with: @author.last_name
    click_on 'Create Author'

    assert_text "can't be blank"

    fill_in 'First name', with: @author.first_name
    click_on 'Create Author'

    assert_text 'Author was successfully created'
    click_on 'Back'
  end
end
