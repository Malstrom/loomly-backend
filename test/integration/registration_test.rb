# test/integration/registration_flow_test.rb
require "test_helper"

class RegistrationTest < ActionDispatch::IntegrationTest
  test "user registration returns success json but no JWT" do
    post "/users", params: {
      user: {
        email: "new@example.com",
        password: "password123",
        password_confirmation: "password123"
      }
    }, as: :json

    assert_response :success

    body = JSON.parse(response.body)
    assert_equal "Signed up successfully.", body["message"]
    assert body["user"]["id"].present?

    refute_includes response.headers.keys, "Authorization"
  end

  test "user registration fails with invalid params" do
    post "/users", params: {
      user: {
        email: "not-an-email",
        password: "short",
        password_confirmation: "different"
      }
    }, as: :json

    assert_response :unprocessable_entity

    body = JSON.parse(response.body)
    assert_includes body["errors"], "Email is invalid"
    assert_includes body["errors"], "Password is too short (minimum is 6 characters)"
    assert_includes body["errors"], "Password confirmation doesn't match Password"
  end
end
