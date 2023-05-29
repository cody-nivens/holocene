# frozen_string_literal: true

require 'test_helper'

class ApplicationRecordsHelperTest < ActionView::TestCase
  test 'supress the first crumb' do
    character = characters(:character_1)
    values = character.set_values
    string = breadcrumb(values[0], values[1], values[2], values[3], values[4])
    string2 = surpress_first(string)
    assert_not_equal string, string2
  end

  test 'should return breadcrumb I' do
    book = books(:book_1)
    values = book.set_values
    string = breadcrumb(values[0], values[1], values[2], values[3], values[4])
    assert_not_equal /|/, string
  end

  test 'should return breadcrumb II' do
    book = books(:book_1)
    chapter = book.chapters.first
    values = chapter.set_values
    string = breadcrumb(values[0], values[1], values[2], values[3], values[4])
    string2 = link_to book.name, book_path(book), method: :get
    assert Regexp.new(string2) =~ string
    assert Regexp.new(chapter.name) =~ string
    assert /|/ =~ string
  end

  test 'should return breadcrumb IIa' do
    book = books(:book_1)
    chapter = book.chapters.last
    section = chapter.sections.last
    values = section.set_values
    string = breadcrumb(values[0], values[1], values[2], values[3], values[4])
    string2 = link_to book.name, book_path(book), method: :get
    string3 = link_to chapter.name, chapter_path(chapter), method: :get
    assert Regexp.new(string2) =~ string
    assert Regexp.new(string3) =~ string
    assert Regexp.new(section.name) =~ string
    assert /|/ =~ string
  end

  test 'should return breadcrumb III' do
    book = books(:book_2)
    story = book.stories.first
    values = story.set_values
    string = breadcrumb(values[0], values[1], values[2], values[3], values[4])
    string2 = link_to book.name, book_path(book), method: :get
    assert Regexp.new(string2) =~ string
    assert Regexp.new(story.name) =~ string
    assert /|/ =~ string
  end

  test 'should return breadcrumb IV' do
    book = books(:book_2)
    story = book.stories.last
    key_point = story.key_points.last
    values = key_point.set_values
    string = breadcrumb(values[0], values[1], values[2], values[3], values[4])
    string2 = link_to book.name, book_path(book), method: :get
    string3 = link_to story.name, story_path(story), method: :get
    assert Regexp.new(string2) =~ string
    assert Regexp.new(string3) =~ string
    assert Regexp.new(key_point.name) =~ string
    assert /|/ =~ string
  end

  test 'should return breadcrumb V' do
    book = books(:book_2)
    story = book.stories.last
    key_point = story.key_points.last
    scene = key_point.scenes.last
    values = scene.set_values
    string = breadcrumb(values[0], values[1], values[2], values[3], values[4])
    string2 = link_to book.name, book_path(book), method: :get
    string3 = link_to story.name, story_path(story), method: :get
    string4 = link_to key_point.name, key_point_path(key_point), method: :get
    assert Regexp.new(string2) =~ string
    assert Regexp.new(string3) =~ string
    assert Regexp.new(string4) =~ string
    assert Regexp.new(scene.name) =~ string
    assert /|/ =~ string
  end

  test 'should return breadcrumb VI' do
    book = books(:book_2)
    story = book.stories.last
    key_point = story.key_points.where(hook: 'Climate Change')[0]
    scene = key_point.scenes.collect { |x| (x.section.nil? ? nil : x) }.compact[0]
    section = scene.section
    values = section.set_values
    string = breadcrumb(values[0], values[1], values[2], values[3], values[4])
    string2 = link_to book.name, book_path(book), method: :get
    string3 = link_to story.name, story_path(story), method: :get
    string4 = link_to key_point.name, key_point_path(key_point), method: :get
    string5 = link_to scene.name, scene_path(scene), method: :get
    assert Regexp.new(string2) =~ string
    assert Regexp.new(string3) =~ string
    assert Regexp.new(string4) =~ string
    #assert Regexp.new(string5) =~ string
    assert Regexp.new(section.name) =~ string
    assert /|/ =~ string
  end
end
