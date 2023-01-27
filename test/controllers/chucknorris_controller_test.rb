require "test_helper"

class ChucknorrisControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get chucknorris_index_url
    assert_response :success
  end
end
