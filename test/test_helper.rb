# frozen_string_literal: true

require 'simplecov'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'download_helpers'
require 'holocene_minitests'
require 'minitest/unit'
require 'mocha/minitest'
require 'sidekiq/testing'
require 'fileutils'

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
      unless has_xpath? "//a[text()='#{line}']/../../*/input[@type='checkbox']", count: 1, wait: 5
        p "#{line} checkbox not found"
        raise Minitest::Assertion
      end
      find(:xpath, "//a[text()='#{line}']/../../*/input[@type='checkbox']").check
    end

    def click_on_line(line,icon)
      unless has_xpath? "//a[text()='#{line}']/../..", count: 1, wait: 5
        p "#{icon} missing for #{line} on line"
        raise Minitest::Assertion
      end
      within(:xpath, "//a[text()='#{line}']/../..") do
        Capybara.page.find(".fa-#{icon}").click
      end
    end

    def click_on_header(text, icon)
      within(:xpath, "//h3[contains(text(),'#{text}')]/..") do
        Capybara.page.find("i.fa-#{icon}").click
      end
    end

    def do_menu(master, sub_action)
      assert_selector "nav.navbar", wait: 5
      assert has_xpath?("//*[@id='nav-bar']/nav/ul/li/a[text()='#{master}']"), wait: 5, msg: "Missing menu top '#{master}'"
      find(:xpath, "//*[@id='nav-bar']/nav/ul/li/a[text()='#{master}']").click

      assert has_xpath?("//*[@id='nav-bar']/nav/ul/li/a[text()='#{master}']/../ul/li/a[text()='#{sub_action}']"), wait: 5, msg: "'#{sub_action}' menu item is missing."
      find(:xpath, "//*[@id='nav-bar']/nav/ul/li/a[text()='#{master}']/../ul/li/a[text()='#{sub_action}']").click
    end

    def assert_new(icon, master, object)
      unless has_css? "#new_object", count: 1, wait: 5
        p "#{master}: #{object} has new object issues"
        raise Minitest::Assertion
      end
      within "#new_object" do
        unless has_css? "a > i.fa-#{icon}", count: 1, wait: 5
          puts "#{master}: #{object} is missing #{icon} in new object"
          raise Minitest::Assertion
        end
      end
    end

    def assert_side(icon, master, object)
      unless has_css? "div#side_controls", count: 1, wait: 5
        p "#{master}: #{object} has side controls issues"
        raise Minitest::Assertion
      end
      within "div#side_controls" do
        unless has_css? "a > i.fa-#{icon}", count: 1, wait: 5
          p "#{master}: #{object} is missing #{icon} in side controls"
          raise Minitest::Assertion
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
