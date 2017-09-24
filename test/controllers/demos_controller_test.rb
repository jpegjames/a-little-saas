require 'test_helper'

class DemosControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get demos_new_url
    assert_response :success
  end

end
