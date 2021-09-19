# frozen_string_literal: true

require 'test_helper'

class ArtifactTest < ActiveSupport::TestCase
  test 'set value' do
    artifact = Artifact.first
    values = artifact.set_values

    assert_equal artifact.book, values[0]
    assert_equal artifact, values[1]
  end
end
