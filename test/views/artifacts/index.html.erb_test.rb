# frozen_string_literal: true

require 'test_helper'

class ArtifactsIndexHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @artifact = artifacts(:artifact_1)
    @book = @artifact.book

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get index' do
    get book_artifacts_url(book_id: @book.id)

    assert_response 200
    @artifacts = Artifact.all

    assert_select 'a[text()=?]', 'New Artifact'
    assert_select 'a[href=?]', new_polymorphic_path([@book, :artifact])
    assert_select '.footer>div>a', 2
    assert_template 'artifacts/index'

    assert_select 'h2', 'Artifacts'

    ['layouts/_nav_links', '_nav_links', 'layouts/_nav_links_for_auth', '_nav_links_for_auth',
     'application/_header', '_header', 'layouts/_messages', '_messages', 'application/_footer', '_footer'].each do |partial|
      assert_template partial: partial
    end
  end
end
