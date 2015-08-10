require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    sign_in users(:alex)
  end

  test 'post create is successful with valid attributes' do
    valid_params = { content: 'great riff!' }
    request.env["HTTP_REFERER"] = root_url
    assert_difference 'Comment.count' do
      post :create, comment: valid_params, riff_id: riffs(:five_four_outro)
    end
    assert_redirected_to root_path
  end

  test 'post create is unsuccessful with invalid attributes' do
    invalid_params = { content: '' }
    assert_no_difference 'Comment.count' do
      post :create, comment: invalid_params, riff_id: riffs(:five_four_outro)
    end
    assert_redirected_to root_path
  end

  test 'delete destroy is successful' do
    assert_difference 'Comment.count', -1 do
      delete :destroy, id: comments(:alex_comment), riff_id: riffs(:five_four_outro)
    end
    assert_redirected_to root_path
  end
end
