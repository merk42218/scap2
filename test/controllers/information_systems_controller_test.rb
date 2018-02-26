require 'test_helper'

class InformationSystemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @information_system = information_systems(:one)
  end

  test "should get index" do
    get information_systems_url
    assert_response :success
  end

  test "should get new" do
    get new_information_system_url
    assert_response :success
  end

  test "should create information_system" do
    assert_difference('InformationSystem.count') do
      post information_systems_url, params: { information_system: { name: @information_system.name, timezone: @information_system.timezone } }
    end

    assert_redirected_to information_system_url(InformationSystem.last)
  end

  test "should show information_system" do
    get information_system_url(@information_system)
    assert_response :success
  end

  test "should get edit" do
    get edit_information_system_url(@information_system)
    assert_response :success
  end

  test "should update information_system" do
    patch information_system_url(@information_system), params: { information_system: { name: @information_system.name, timezone: @information_system.timezone } }
    assert_redirected_to information_system_url(@information_system)
  end

  test "should destroy information_system" do
    assert_difference('InformationSystem.count', -1) do
      delete information_system_url(@information_system)
    end

    assert_redirected_to information_systems_url
  end
end
