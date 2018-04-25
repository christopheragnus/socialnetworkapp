require 'test_helper'

class UserFlowTest < ActionDispatch::IntegrationTest
  test "user login, browse, and logout" do
    user = users(:user1)

    get "/login"

    assert_response :success

    post sessions_url "/sessions",
                      email: user.email,
                      password: "password"

    follow_redirect!

    assert_equal "/", path

    get_via_redirect "/logout"

    assert_equal "/login", path
  end
end
