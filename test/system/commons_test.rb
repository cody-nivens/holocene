require "application_system_test_case"

class CommonsTest < ApplicationSystemTestCase
  setup do
    @act = acts(:act_1)
    @user = users(:users_1)
    sign_in @user
  end

#  %w[act actor location ].each do |object|
  tasks = { 'Stage' => %w[ act actor location ],
            'Support' => %w[ epoch artifact event_type region author artifact_type character_category ] 
  }
  otasks = { 
            'Support' => %w[ ] 
  }
  tasks.keys.each do |master|
    tasks[master].each do |object|

      test "visiting the #{object} index" do
        title = object.gsub(/_/,' ').camelize
        visit root_url
        assert_text 'The Phantom'
        click_on 'The Phantom'
        assert_text 'The Beginnings'
    
        do_menu master, "#{title.pluralize}"
    
        assert_text "#{title.pluralize}"
        click_new 'plus'
    
        assert_current_path root_url
        case object
        when 'author'
          assert_text "First name"
        else
          assert_text "Name"
          fill_in "Name", with: "Strangeness in Space"
        end

        case object
        when 'epoch'
           fill_in 'End date', with: '2000'
           fill_in 'Start date', with: '1900'
        when 'artifact'
          select 'John', from: 'artifact_character_id'
          select 'Ship', from: 'artifact_artifact_type_id'
        when 'author'
          fill_in "First name", with: "Snoopy"
          fill_in "Last name", with: "Brown"
        end
    
        click_on "Create #{title}"
    
        assert_current_path root_url
        assert_text "#{title} was successfully created"
    
        case object
        when 'author'
          assert_link "Snoopy"
          assert_text "Brown"
          click_on "Snoopy"
        else
          assert_text "Strangeness in Space"
          click_on "Strangeness in Space"
        end
    
        assert_side 'Edit'
    
        click_side 'edit'
        assert_current_path root_url
    
        case object
        when 'author'
          assert_text "First name"
          fill_in "First name", with: "Charlie"
        else
          assert_text "Name"
          fill_in "Name", with: "Seemingly Case"
        end
    
        click_on "Update #{title}"
    
        assert_text "#{title} was successfully updated"

        case object
        when 'author'
          assert_text "Charlie"
        else
          assert_text "Seemingly Case"
        end
    
        click_side 'backward'
        assert_current_path root_url
    
        case object
        when 'author'
          assert_link "Charlie"
          accept_alert do
            click_on_line "Charlie", "trash"
          end
        else
          assert_link "Seemingly Case"
          accept_alert do
            click_on_line "Seemingly Case", "trash"
          end
        end
        assert_text "#{title} was successfully destroyed"
    
        
        unless ['character_category', 'epoch', 'event_type'].include?(object)
          click_side 'backward'
        end
        assert_current_path root_url
      end
    end
  end

  if 1 == 0
  test "updating a Act" do
    visit acts_url
    click_on "Edit", match: :first

    fill_in "Book", with: @act.book_id
    fill_in "Name", with: @act.name
    click_on "Update Act"

    assert_text "Act was successfully updated"
    click_on "Back"
  end

  test "destroying a Act" do
    visit acts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Act was successfully destroyed"
  end

end
end
