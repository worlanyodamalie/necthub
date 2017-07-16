require 'test_helper'

class FundraisingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fundraisings_index_url
    assert_response :success
  end

end
