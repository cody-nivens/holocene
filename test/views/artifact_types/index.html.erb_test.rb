# frozen_string_literal: true

require 'test_helper'

class ArtifactTypesIndexHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @artifact_type = artifact_types(:artifact_type_1)
    @book = @artifact_type.book

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get index' do
    get book_artifact_types_url(book_id: @book.id)

    assert_response 200
    @artifact_types = ArtifactType.all

    assert_select 'a[text()=?]', 'New Artifact Type'
    assert_select 'a[href=?]', new_polymorphic_path([@book, :artifact_type])
    assert_select '.footer>div>a', 2
    assert_template 'artifact_types/index'

    assert_select 'h1', 'Artifact Types'

    ['layouts/_nav_links', '_nav_links', 'layouts/_nav_links_for_auth', '_nav_links_for_auth',
     'application/_header', '_header', 'layouts/_messages', '_messages', 'application/_footer', '_footer'].each do |partial|
      assert_template partial: partial
    end
  end
end
