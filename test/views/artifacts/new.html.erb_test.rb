# frozen_string_literal: true

require 'test_helper'

class ArtifactsNewHtmlErbTest < ActionDispatch::IntegrationTest
  setup do
    @artifact = artifacts(:artifact_1)
    @book = @artifact.book

    @user = users(:users_1)
    sign_in @user
  end

  test 'should get new' do
    get new_polymorphic_url([@book, :artifact])
    assert_response :success

    assert_select 'a[text()=?]', 'Back'
    assert_select 'a[href=?]', book_artifacts_path(@book)
    assert_select '.footer>div>a', 1
    assert_template 'artifacts/new'
  end
end
