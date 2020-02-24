require 'test_helper'

class SpotsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get spots_index_url
    assert_response :success
  end

  test "should get view" do
    get spots_view_url
    assert_response :success
  end

end
