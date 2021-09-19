require 'test_helper'

class ArtifactsTaggedHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @artifact = artifacts(:artifact_1)
    @book = @artifact.book

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get tagged' do
    get tag_artifacts_url(book_id: @book.id)

    assert_response 200

    assert_template 'artifacts/tagged'

    # assert_select 'h1','Tagged'

    ['layouts/_nav_links', '_nav_links', 'layouts/_nav_links_for_auth', '_nav_links_for_auth',
     'application/_header', '_header', 'layouts/_messages', '_messages', 'application/_footer', '_footer'].each do |partial|
      assert_template partial: partial
    end
  end
end
