require 'test_helper'

class AnnoucementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get annoucements_index_url
    assert_response :success
  end

  test "should get new" do
    get annoucements_new_url
    assert_response :success
  end

end
