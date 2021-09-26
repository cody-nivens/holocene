task stats: 'holocene:stats'

namespace :holocene do
  task :stats do
    require 'rails/code_statistics'
    ::STATS_DIRECTORIES << ['Lib tests', 'test/lib']
    ::STATS_DIRECTORIES << ['View tests', 'test/views']
    ::STATS_DIRECTORIES << ['Worker tests', 'test/workers']
    ::STATS_DIRECTORIES << ['Grids', 'app/grids']
    CodeStatistics::TEST_TYPES << 'Lib tests'
    CodeStatistics::TEST_TYPES << 'View tests'
    CodeStatistics::TEST_TYPES << 'Worker tests'
  end
end
