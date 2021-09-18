require "erb"
require 'active_support/core_ext/string'
require 'byebug'

# Create template.
index_template = %q{require 'test_helper'

class <%= pklass %>IndexHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @<%= single_var %>= <%= plural_var %>(:<%= single_var %>_1)
    @book = @<%= single_var %>.book

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get index' do
    get book_<%= plural_var %>_url(:book_id => @book.id)

    assert_response 200
    @<%= plural_var %> = <%= klass %>.all

    assert_select "a[text()=?]",'New <%= klass %>'
    assert_select "a[href=?]", new_polymorphic_path([@book, :<%= single_var %>])
    assert_select "a[href=?]", polymorphic_path([@book, :<%= plural_var %>_list])
    assert_select ".footer>div>a", 2
    assert_template '<%= plural_var %>/index'

    assert_select 'h1','<%= pklass %>'

    ["layouts/_nav_links", "_nav_links", "layouts/_nav_links_for_auth", "_nav_links_for_auth",
     "application/_header", "_header", "layouts/_messages", "_messages", "application/_footer", "_footer"].each do |partial|
      assert_template partial: partial
    end
  end
end
}

edit_template = %q{require 'test_helper'

class <%= pklass %>EditHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @<%= single_var %>= <%= plural_var %>(:<%= single_var %>_1)
    @book = @<%= single_var %>.book

    @user = users(:users_1)
    sign_in @user
  end

  test "should get edit" do
    get edit_polymorphic_url([@book,@<%= single_var %>])
    assert_select "a[text()=?]",'Back'
    assert_response :success

    assert_select "a[text()=?]",'Show'
    assert_select "a[href=?]", polymorphic_path([@book, @<%= single_var %>])
    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", polymorphic_path([@book, :<%= plural_var %>])
    assert_select ".footer>div>a", 2
    assert_template '<%= plural_var %>/edit'
  end
end
}

new_template = %q{require 'test_helper'

class <%= pklass %>NewHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @<%= single_var %>= <%= plural_var %>(:<%= single_var %>_1)
    @book = @<%= single_var %>.book

    @user = users(:users_1)
    sign_in @user
  end

  test "should get new" do
    get new_polymorphic_url([@book, :<%= single_var %>])
    assert_response :success

    assert_select "a[text()=?]",'Back'
    assert_select "a[href=?]", book_<%= plural_var %>_path(@book)
    assert_select ".footer>div>a", 1
    assert_template '<%= plural_var %>/new'
  end
end
}

show_template = %q{require 'test_helper'

class <%= pklass %>ShowHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @<%= single_var %>= <%= plural_var %>(:<%= single_var %>_1)
    @book = @<%= single_var %>.book

    @user = users(:users_1)
    sign_in @user
  end

  test "should show <%= single_var %>" do
    get polymorphic_path([@book, @<%= single_var %>])
    assert_response :success

    assert_select "a[text()=?]",'Edit'
    assert_select "a[href=?]", edit_polymorphic_path([@book, @<%= single_var %>])
    assert_select "a[text()=?]",'Back'
    assert_select ".footer>div>a", 2
    assert_template '<%= plural_var %>/show'
  end
end
}

# Set up template data.
models = %w(artifact artifact_type aside author biblioentry book chapter character_attribute character_category character
character_scene character_story character_value city concerns epoch event_type footnote glossary_term holocene_event itinerary
key_point key_word metric namer partition region role scene section signet story timeline tour user)

single_var = nil
plural_var =  nil
klass =  nil
pklass =  nil

dir = "test"
Dir.mkdir(dir) unless Dir.exists?(dir)

models.each do |model|

  klass = model.camelcase
  pklass = klass.pluralize
  single_var = klass.underscore.singularize
  plural_var = pklass.underscore
  dir = "test/views/#{plural_var}"
  Dir.mkdir(dir) unless Dir.exists?(dir)

# Produce result.
  index_message = ERB.new(index_template, trim_mode: "%<>")
  file = index_message.result
  File.write("test/views/#{plural_var}/index.html.erb_test.rb", file)
  new_message = ERB.new(new_template, trim_mode: "%<>")
  file = new_message.result
  File.write("test/views/#{plural_var}/new.html.erb_test.rb", file)
  edit_message = ERB.new(edit_template, trim_mode: "%<>")
  file = edit_message.result
  File.write("test/views/#{plural_var}/edit.html.erb_test.rb", file)
  show_message = ERB.new(show_template, trim_mode: "%<>")
  file = show_message.result
  File.write("test/views/#{plural_var}/show.html.erb_test.rb", file)
end
