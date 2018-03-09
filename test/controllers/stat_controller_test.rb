require 'test_helper'

class StatControllerTest < ActionDispatch::IntegrationTest
  test "should get gra1" do
    get stat_gra1_url
    assert_response :success
  end

  test "should get gra2" do
    get stat_gra2_url
    assert_response :success
  end

end
