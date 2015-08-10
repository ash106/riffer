require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test 'has valid test data' do
    Comment.find_each do |comment|
      assert_valid comment
    end
  end

  test 'must have content' do
    invalid_comment = Comment.new
    assert_invalid invalid_comment, content: "can't be blank"
  end
end
