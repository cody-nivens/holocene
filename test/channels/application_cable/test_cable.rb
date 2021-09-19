# frozen_string_literal: true

require 'test_helper'

module ApplicationCable
  class ConnectionTest < ActionCable::Connection::TestCase
    #  test "connects with params" do
    #    # Simulate a connection opening by calling the `connect` method
    #    connect params: { user_id: 42 }
    #
    #    # You can access the Connection object via `connection` in tests
    #    assert_equal connection.user_id, "42"
    #  end
    #
    #  test "rejects connection without params" do
    #    # Use `assert_reject_connection` matcher to verify that
    #    # connection is rejected
    #    assert_reject_connection { connect }
    #  end
  end
end
