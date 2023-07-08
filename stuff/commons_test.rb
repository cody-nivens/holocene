require "application_system_test_case"

class CommonsTest < ApplicationSystemTestCase
  setup do
    @act = acts(:act_1)
    @user = users(:users_1)
    sign_in @user
  end

#  %w[act actor location ].each do |object|
  otasks = { 'Stage' => %w[ act actor location ],
            'Book' => %w[ plot_point ] ,
            'Story' => %w[ tour ],
            'Chapter' => %w[ footnote ],
            'BookC' => %w[ bibliography ],
            'Support' => %w[ holocene_event city epoch artifact event_type region author artifact_type character_category ] 
  }
  tasks = { 
            'Chapter' => %w[ footnote ],
  }
  tasks.keys.each do |master|
    tasks[master].each do |object|
      test "drive the #{object} cycle" do
        drive_cycle(master, object)
      end
    end
  end
end
