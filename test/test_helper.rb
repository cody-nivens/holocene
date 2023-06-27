# frozen_string_literal: true

if ENV["COVERAGE"]
  require 'simplecov'
  SimpleCov.start 'rails' do
    command_name "features#{ENV["TEST_ENV_NUMBER"]}" if ENV["TEST_ENV_NUMBER"]
  end
end

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'download_helpers'
require 'holocene_minitests'
require 'minitest/unit'
require 'mocha/minitest'
require 'sidekiq/testing'
require 'fileutils'
require 'mock_redis'
#require 'minitest/display'

#MiniTest::Display.options = {
#  :output_slow =>25, 
#    suite_names: false,
#    color: true,
#    print: {
#      success: ".",
#      failure: "F",
#      error: "E"
#    }
#  }

if ENV["COVERAGE"]
  SimpleCov.enable_for_subprocesses true
  SimpleCov.at_fork do |pid|
    # This needs a unique name so it won't be overwritten
    SimpleCov.command_name "#{SimpleCov.command_name} (subprocess: #{pid})"
    # be quiet, the parent process will be in charge of output and checking coverage totals
    SimpleCov.print_error_status = false
    SimpleCov.formatter SimpleCov::Formatter::SimpleFormatter
    SimpleCov.minimum_coverage 0
    # start
    SimpleCov.start 'Rails'
  end
end

module SidekiqMinitestSupport
  def after_teardown
    Sidekiq::Worker.clear_all
    super
  end
end

module SphinxHelpers
  $initialized = false

  def init_sphinx_helpers
    $initialized ||= false
  end

  def index
    ThinkingSphinx::Test.index
    # Wait for Sphinx to finish loading in the new index files.
    sleep 0.25 until index_finished?
  end

  def index_finished?
    Dir[Rails.root.join(ThinkingSphinx::Test.config.indices_location, '*.{new,tmp}*')].empty?
  end
end

def ts_index_finished?
  Dir[Rails.root.join(ThinkingSphinx::Test.config.indices_location, '*.{new,tmp}*')].empty?
end

class ActiveStorage::Blob
  def self.fixture(filename:, **attributes)
    blob = new(
      filename: filename,
      service_name: 'test',
      key: generate_unique_secure_token
    )
    io = Rails.root.join("test/fixtures/files/#{filename}").open
    blob.unfurl(io)
    blob.assign_attributes(attributes)
    blob.upload_without_unfurling(io)

    blob.attributes.transform_values { |values| values.is_a?(Hash) ? values.to_json : values }.compact.to_json
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


def locked? lockfile_name
  f = File.open(lockfile_name, File::CREAT)

  # returns false if already locked, 0 if not
  ret = f.flock(File::LOCK_EX|File::LOCK_NB)

  # unlocks if possible, for cleanup; this is a noop if lock not acquired
  f.flock(File::LOCK_UN)

  f.close
  !ret # ret == false means we *couldn't* get a lock, i.e. it was locked
end

ActiveSupport::Testing::Parallelization.after_fork_hook do |i|
  ENV['TEST_ENV_NUMBER'] = i.to_s
  if ENV["COVERAGE"]
    SimpleCov.command_name "features#{ENV["TEST_ENV_NUMBER"]}"
  end
end

def init_sphinx
  lock_file = Rails.root.join("tmp/test_parallel.lock")
  if ENV['TEST_ENV_NUMBER'].to_i.zero?
    FileUtils.touch(lock_file)
    ThinkingSphinx::Test.index
    sleep 0.25 until ts_index_finished?
    File.delete(lock_file)
  else
    sleep 0.25 until ts_index_finished?
  end
end

module ActiveSupport
  class TestCase
    parallelize(workers: :number_of_processors)

    fixtures :all

    set_fixture_class 'tags' => ActsAsTaggableOn::Tag
    set_fixture_class 'taggings' => ActsAsTaggableOn::Tagging

    include ApplicationHelper
    include SphinxHelpers
    include HoloceneMinitests
    include Devise::Test::IntegrationHelpers

    def self.prepare
      ThinkingSphinx::Test.init
      # Configure and start Sphinx, and automatically
      # stop Sphinx at the end of the test suite.
      ThinkingSphinx::Test.start_with_autostop
    end

    def setup
      $redis.flushall
    end

    def teardown
      Capybara.reset_sessions!
      $redis.flushall
    end

    def after_run
      #      FileUtils.rm_rf(Rails.root.join(ThinkingSphinx::Test.config.indices_location))
      #      FileUtils.mkdir(Rails.root.join(ThinkingSphinx::Test.config.indices_location))
      lock_file = FileUtils.rm(Rails.root.join("tmp/test_parallel.lock"))
      File.delete(lock_file) if File.exist?(lock_file)
    end

    def fill_in_editor(id, with:)
      find(:css, ".#{id}").click.set(with)
    end

    def fill_in_rich_text_area(id, with:)
      find(".trix-content").set(with)
    end

    def check_line_with(line)
      unless has_xpath? "//a[text()='#{line}']/../../*/input[@type='checkbox']", count: 1
        raise Minitest::Assertion, "#{line} checkbox not found"
      end
      find(:xpath, "//a[text()='#{line}']/../../*/input[@type='checkbox']").check
    end

    def click_on_line(line,icon)
     if has_xpath? "//a[text()='#{line}']/../..", count: 1, wait: 0
       within(:xpath, "//a[text()='#{line}']/../..") do
         Capybara.page.find(".fa-#{icon}", wait: 0).click
       end
     else
       raise Minitest::Assertion, "#{line} line missing for click_on_line"
      end
    end

    def click_on_header(text, icon)
      within(:xpath, "//h3[contains(text(),'#{text}')]/..") do
        Capybara.page.find("i.fa-#{icon}").click
      end
    end

    def do_menu(master, object, debug: false)
      p "Verify menu #{master}" if debug
      assert_selector "nav.navbar"
      assert has_xpath?("//*[@id='nav-bar']/nav/ul/li/a[text()='#{master}']"), msg: "Missing menu top '#{master}'"
      find(:xpath, "//*[@id='nav-bar']/nav/ul/li/a[text()='#{master}']").click
      p "Clicked menu #{master}" if debug

      p "Verify menu item #{object} on #{master}" if debug
      assert has_xpath?("//*[@id='nav-bar']/nav/ul/li/a[text()='#{master}']/../ul/li/a[text()='#{object}']"), msg: "'#{object}' menu item is missing."
      find(:xpath, "//*[@id='nav-bar']/nav/ul/li/a[text()='#{master}']/../ul/li/a[text()='#{object}']").click
      p "Clicked menu item #{object} on #{master}" if debug
    end

    def assert_new(icon, master, object)
      unless has_css? "#new_object", count: 1
        raise Minitest::Assertion, "#{master}: #{object} has new object issues"
      end
      within "#new_object" do
        unless has_css? "a > i.fa-#{icon}", count: 1
          raise Minitest::Assertion, "#{master}: #{object} is missing #{icon} in new object"
        end
      end
    end

    def assert_side(icon, master, object)
      unless has_css? "div#side_controls", count: 1
        raise Minitest::Assertion, "#{master}: #{object} has multiple in side controls"
      end
      within "div#side_controls" do
        unless has_css? "a > i.fa-#{icon}", count: 1
          raise Minitest::Assertion, "#{master}: #{object} is missing #{icon} in side controls"
        end
      end
    end

    def assert_no_side(icon, master, object, debug: false)
      p "Verifing side controls for #{master}:#{object}" if debug
      if has_css? "div#side_controls", wait: 0
        p "Verified side controls for #{master}:#{object}" if debug
        within "div#side_controls" do
          if has_css? "a > i.fa-#{icon}", wait: 0
            raise Minitest::Assertion, "#{master}: #{object} has #{icon} in side controls"
          end
          p "Verified #{icon} in side controls for #{master}:#{object}" if debug
        end
      end
    end

    def click_new(icon)
      within "#new_object" do
        Capybara.page.find("a > i.fa-#{icon}").click
      end
    end

    def click_side(icon)
      within "div#side_controls" do
        Capybara.page.find("a > i.fa-#{icon}").click
      end
    end

    def wait_for_turbo_frame(selector = 'turbo-frame', timeout = nil)
      if has_selector?("#{selector}[busy]", visible: true, wait: (0.25).seconds)
        has_no_selector?("#{selector}[busy]", wait: timeout.presence || 5.seconds)
      end
    end

    def row_containing_cell_with_text(text)
      find('td,th', text: text).ancestor('tr')
    end

    def second_row_containing_cell_with_text(text)
      find('td,th:nth-of-type(1)', text: text).ancestor('tr')
    end

    def convert_pdf_to_page(content)
      pdf_io = StringIO.new(content)
      reader = PDF::Reader.new(pdf_io)
      reader.pages.map(&:to_s).join("\n")
    end
  end
end
