unless ENV['NO_COVERAGE']
  SimpleCov.coverage_dir "coverage_#{ENV['TEST_ENV_NUMBER'] || ''}"
  SimpleCov.start :rails do
    enable_coverage :branch
    primary_coverage :branch
    add_group 'Grids', 'app/grids'
#    command_name 'Minitest'
    formatter SimpleCov::Formatter::MultiFormatter.new([
      SimpleCov::Formatter::SimpleFormatter,
      SimpleCov::Formatter::HTMLFormatter
    ])

    #track_files "**/*.rb"
  end
  SimpleCov.enable_for_subprocesses true
  SimpleCov.at_fork do |pid|
    # This needs a unique name so it won't be ovewritten
    SimpleCov.command_name "#{SimpleCov.command_name} (subprocess: #{pid})"
    # be quiet, the parent process will be in charge of output and checking coverage totals
    SimpleCov.print_error_status = false
    SimpleCov.formatter SimpleCov::Formatter::SimpleFormatter
    SimpleCov.minimum_coverage 0
    # start
    SimpleCov.start
  end
end
