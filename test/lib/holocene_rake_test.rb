# test/lib/user_notify_test.rb
require 'test_helper'

class HoloceneRakeTaskTest < ActiveSupport::TestCase
  setup do
    Holocene::Application.load_tasks

    original_stdout = $stdout
    $stdout = File.open(File::NULL, 'w')
    Rake::Task['stats'].invoke
    $stdout = original_stdout
  end

  test "that the task is run" do
    assert true
  end

end
