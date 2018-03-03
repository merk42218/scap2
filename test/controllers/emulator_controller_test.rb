require 'test_helper'

class EmulatorControllerTest < ActionDispatch::IntegrationTest
  test "should get generate1" do
    get emulator_generate1_url
    assert_response :success
  end

  test "should get generate2" do
    get emulator_generate2_url
    assert_response :success
  end

end
