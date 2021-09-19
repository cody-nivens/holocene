# frozen_string_literal: true

require 'simplecov'
unless ENV['NO_COVERAGE']
  SimpleCov.start :rails do
    enable_coverage :branch
    primary_coverage :branch
    add_group 'Grids', 'app/grids'
  end
end
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'download_helpers'
require 'minitest/unit'
require 'mocha/minitest'
require 'sidekiq/testing'

module SidekiqMinitestSupport
  def after_teardown
    Sidekiq::Worker.clear_all
    super
  end
end

module SphinxHelpers
  def index
    ThinkingSphinx::Test.index
    # Wait for Sphinx to finish loading in the new index files.
    sleep 0.25 until index_finished?
  end

  def index_finished?
    Dir[Rails.root.join(ThinkingSphinx::Test.config.indices_location, '*.{new,tmp}*')].empty?
  end
end

module MiniTest
  class Spec
    include SidekiqMinitestSupport
  end
end

module MiniTest
  class Unit
    class TestCase
      include SidekiqMinitestSupport
    end
  end
end

module ActiveSupport
  class TestCase
    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    set_fixture_class 'tags' => ActsAsTaggableOn::Tag
    set_fixture_class 'taggings' => ActsAsTaggableOn::Tagging
    # Add more helper methods to be used by all tests here...
    include ApplicationHelper
    include SphinxHelpers
    include Devise::Test::IntegrationHelpers

    def self.prepare
      DownloadHelpers.clear_downloads
    end
    prepare

    def setup
      # Add code that need to be executed before each test
      holocene_event = holocene_events(:holocene_event_1)
      file = Rails.root.join('test', 'fixtures', 'files', 'image.jpg')
      holocene_event.image.attach(io: File.open(file), filename: 'image.jpg')
    end

    def teardown
      # Add code that need to be executed after each test
      Capybara.reset_sessions!
    end

    def fill_in_editor(id, with:)
      find(:css, ".#{id}").click.set(with)
    end

    def fill_in_rich_text_area(id, with:)
      find(:css, id.to_s).click.set(with)
    end

    def row_containing_cell_with_text(text)
      find('td,th', text: text).ancestor('tr')
    end

    def second_row_containing_cell_with_text(text)
      find('td,th:nth-of-type(1)', text: text).ancestor('tr')
    end

    def convert_pdf_to_page(content)
      pdf_io = StringIO.new(content)
      # debugger
      reader = PDF::Reader.new(pdf_io)
      reader.pages.map(&:to_s).join("\n")
    end

    # assert react_component render
    #
    # assert_react_component("HelloWorld") do |props|
    #   assert_equal "Hello world", props[:message]
    # end
    def assert_react_component(name)
      assert_select 'div[data-react-class]' do |dom|
        assert_select '[data-react-class=?]', name

        if block_given?
          props = JSON.parse(dom.attr('data-react-props'))
          props.deep_transform_keys! { |key| key.to_s.underscore }
          props.deep_symbolize_keys!

          yield(props)
        end
      end
    end
  end
end
