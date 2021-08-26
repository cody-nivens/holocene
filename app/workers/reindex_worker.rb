class ReindexWorker
  include Sidekiq::Worker

  def perform(*args)
    Holocene::Application.load_tasks
    Rake::Task['ts:index'].invoke
  end
end
