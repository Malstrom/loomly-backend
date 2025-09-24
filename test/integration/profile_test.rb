# frozen_string_literal: true

require 'test_helper'

class ProfileTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!(email: 'profile@example.com', password: 'password123', password_confirmation: 'password123')

    post '/users/sign_in', params: {
      user: { email: @user.email, password: 'password123' }
    }, as: :json

    @token = response.headers['Authorization']
  end

  test 'user can access profile with valid JWT' do
    get '/api/v1/profile', headers: { 'Authorization' => @token }, as: :json

    assert_response :success
    body = JSON.parse(response.body)
    assert_equal @user.email, body['email']
  end

  test 'unauthorized without JWT' do
    get '/api/v1/profile', as: :json
    assert_response :unauthorized
  end
end
