require 'test_helper'
class ReindexWorkerTest < Minitest::Test
  def test_that_mode_can_change_within_a_block
    model = Scene.first
    ReindexWorker.perform_async(model.id)
    # This would fail in `fake` mode, no indexing would happen
    #assert model.reload.indexed?
  end
end
