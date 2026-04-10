require "test_helper"

class ApiControllerTest < ActionDispatch::IntegrationTest
  test "should get documentation" do
    get api_documentation_url
    assert_response :success
  end
end
