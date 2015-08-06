require 'test_helper'

class RiffTest < ActiveSupport::TestCase
  test 'has valid test data' do
    Riff.find_each do |riff|
      assert_valid riff
    end
  end

  test 'must have an audio file' do
    invalid_riff = Riff.new
    assert_invalid invalid_riff, audio: "can't be blank"
  end
end
