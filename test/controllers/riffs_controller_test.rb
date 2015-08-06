require 'test_helper'

class RiffsControllerTest < ActionController::TestCase
  test 'get index is successful' do
    get :index
    assert_includes assigns(:riffs), riffs(:tsoaf)
    assert_response :success
  end

  test 'get show is successful' do
    get :show, id: riffs(:tsoaf).id
    assert_equal riffs(:tsoaf), assigns(:riff)
    assert_response :success
  end

  test 'get new is successful' do
    get :new
    assert_kind_of Riff, assigns(:riff)
    assert_response :success
  end

  test 'get edit is successful' do
    get :edit, id: riffs(:tsoaf).id
    assert_equal riffs(:tsoaf), assigns(:riff)
    assert_response :success
  end

  test 'post create is successful with valid attributes' do
    valid_params = { audio: Rack::Test::UploadedFile.new(Rails.root + "test/files/Asians.mp3", "audio/mp3"),
                     description: 'The gong song' }
    assert_difference 'Riff.count' do
      post :create, riff: valid_params
    end
    assert_redirected_to riffs_path
  end

  test 'post create is unsuccessful with invalid attributes' do
    invalid_params = { audio: '', description: '' }
    assert_no_difference 'Riff.count' do
      post :create, riff: invalid_params
    end
    assert_template :new
    assert_response :success
  end

  test 'put update is successful with valid attributes' do
    valid_attributes = { audio: Rack::Test::UploadedFile.new(Rails.root + "test/files/5_4_Outro.mp3", "audio/mp3"),
                         description: "5/4 Outro" }
    put :update, id: riffs(:tsoaf).id, riff: valid_attributes
    assert_equal valid_attributes[:audio].original_filename, riffs(:tsoaf).reload.audio_file_name
    assert_redirected_to riff_path(riffs(:tsoaf))
  end

  test 'put update is unsuccessful with invalid attributes' do
    invalid_attributes = { audio: Rack::Test::UploadedFile.new(Rails.root + "test/files/charlie_cheese.jpeg", "image/jpeg") }
    put :update, id: riffs(:tsoaf).id, riff: invalid_attributes
    refute_equal invalid_attributes[:audio].original_filename, riffs(:tsoaf).reload.audio_file_name
    assert_template :edit
    assert_response :success
  end

  test 'delete destroy is successful' do
    assert_difference 'Riff.count', -1 do
      delete :destroy, id: riffs(:tsoaf).id
    end
    assert_redirected_to riffs_path
  end
end
