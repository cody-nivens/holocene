require 'sidekiq-scheduler'

class ReindexWorker
  include Sidekiq::Worker

  def perform(*_args)
    Holocene::Application.load_tasks
    Rake::Task['ts:index'].invoke
  end
end
