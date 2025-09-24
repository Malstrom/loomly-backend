require "test_helper"

class SessionFlowTest < ActionDispatch::IntegrationTest
  include Warden::Test::Helpers

  def setup
    @user = User.create!(
      email: "logout_test@example.com",
      password: "superSecret123",
      password_confirmation: "superSecret123"
    )
  end

  test "logout with valid token returns success" do
    post user_session_path, params: {
      user: { email: @user.email, password: "superSecret123" }
    }, as: :json

    assert_response :success
    token = response.headers["Authorization"]
    assert token.present?, "Expected JWT in Authorization header"

    delete destroy_user_session_path,
           headers: { "Authorization" => token },
           as: :json

    assert_response :success
    body = JSON.parse(response.body)
    assert_equal "Logged out successfully.", body["message"]
  end

  test "logout without token returns unauthorized" do
    delete destroy_user_session_path, as: :json

    assert_response :unauthorized
    body = JSON.parse(response.body)
    assert_includes body["errors"], "Invalid token"
  end
end
