require "application_system_test_case"

class CommonsTest < ApplicationSystemTestCase
  setup do
    @act = acts(:act_1)
    @user = users(:users_1)
    sign_in @user
  end

#  %w[act actor location ].each do |object|
  tasks = { 'Stage' => %w[ act actor location ],
            'Book' => %w[ plot_point ] ,
            'Story' => %w[ tour ],
            'Support' => %w[ holocene_event city epoch artifact event_type region author artifact_type character_category ] 
  }
  otasks = { 
            'Support' => %w[ holocene_event ] 
  }
  tasks.keys.each do |master|
    tasks[master].each do |object|

      test "visiting the #{object} index" do
        title_low = object.gsub(/_/,' ').camelize
        title = title_low.titleize
        visit root_url
        assert_text 'The Phantom'
        click_on 'The Phantom'
        assert_text 'The Beginnings'
        click_on 'The Beginnings'
        assert_text 'Climate Change'

        do_menu master, "#{title.pluralize}"
    
        assert_text "#{title.pluralize}"

        click_new 'plus'
    
        assert_current_path root_url
        case object
        when 'key_word'
          assert_text 'stormy'
        when 'author'
          assert_text "First name"
        when 'city'
          has_css? 'input[name="city[name]"]'
        else
          assert_text "Name"
        end

        case object
        when 'key_word'
          fill_in "Key word", with: "Strangeness in Space"
        when 'city'
          fill_in "city[name]", with: "Strangeness in Space"
          fill_in "city[lat]", with: "45.3246"
          fill_in "city[lng]", with: "118.0877"
        when 'epoch'
          fill_in "Name", with: "Strangeness in Space"
           fill_in 'End date', with: '2000'
           fill_in 'Start date', with: '1900'
        when 'artifact'
          fill_in "Name", with: "Strangeness in Space"
          select 'John', from: 'artifact_character_id'
          select 'Ship', from: 'artifact_artifact_type_id'
        when 'author'
          fill_in "First name", with: "Snoopy"
          fill_in "Last name", with: "Brown"
        when 'holocene_event'
          fill_in "Name", with: "Strangeness in Space"
          fill_in "Start year", with: "-300"
        else
          fill_in "Name", with: "Strangeness in Space"
        end
    
        case object
        when 'character_category','key_word','plot_point','artifact_type'
          click_on "Create #{title_low}"
        else
          click_on "Create #{title}"
        end
    
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
    
        case object
        when 'key_word'
          assert_link "Strangeness in Space"
          find("div > turbo-frame##{dom_id KeyWord.last} > div > a", match: :first).click
          assert_text "Key word:"
          assert_no_text 'stormy'
        end

    
        assert_side 'Edit'
        click_side 'edit'
        assert_current_path root_url
        assert_no_text "Content missing"
    
        case object
        when 'city'
          assert_text "Simple map"
          fill_in "city[name]", with: "Seemingly Case"
        when 'author'
          assert_text "First name"
          fill_in "First name", with: "Charlie"
        else
          assert_text "Name"
          fill_in "Name", with: "Seemingly Case"
        end
    
        case object
        when 'artifact_type','character_category','plot_point'
          click_on "Update #{title_low}"
        else
          click_on "Update #{title}"
        end
    
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
    
        
        unless %w[city holocene_event character_category epoch event_type].include?(object)
          click_side 'backward'
        end
        assert_current_path root_url
      end
    end
  end
end
