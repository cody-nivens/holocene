require 'simplecov'
SimpleCov.start 'rails'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'download_helpers'


class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  set_fixture_class "tags" => ActsAsTaggableOn::Tag
  set_fixture_class "taggings" => ActsAsTaggableOn::Tagging
  # Add more helper methods to be used by all tests here...
  include ApplicationHelper
  include Devise::Test::IntegrationHelpers

    def self.prepare
      DownloadHelpers::clear_downloads
    end
    prepare

    def setup
      # Add code that need to be executed before each test
    end

    def teardown
      # Add code that need to be executed after each test
      Capybara.reset_sessions!
    end

    def convert_pdf_to_page(content)
      pdf_io = StringIO.new(content)
      reader = PDF::Reader.new(pdf_io)
      contents = reader.pages.map(&:to_s).join("\n")
      return contents
    end
end
