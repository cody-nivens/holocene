require 'test_helper'

class Character::StepsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:book_2)
    @user = users(:users_1)
    sign_in @user
  end

  test "should get show" do
    post book_characters_url(:book_id => @book.id)
    @character = Character.last
    assert_redirected_to book_character_step_path(:book_id => @book.id,:character_id => @character.id, :id =>"characteristics")
    follow_redirect!
    assert_response :success

    patch book_character_step_url(:book_id => @book.id),
      params: { :book_id=>@book.id, :age=>"55", :year=>"105", :death_age=>"89", :character=>{:race=>"White", :birth_year=>"50", :death_year=>"139"}, :commit=>"Next Step", :character_id=>@character.id, :id=>"charcteristics"}

    assert_redirected_to book_character_step_path(:book_id => @book.id,:character_id => @character, :id =>"identity")
    follow_redirect!
    assert_response :success

  end

end
