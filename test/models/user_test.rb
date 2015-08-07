require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'has valid test data' do
    User.find_each do |user|
      assert_valid user
    end
  end
end
