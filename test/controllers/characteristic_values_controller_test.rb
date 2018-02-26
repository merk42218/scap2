require 'test_helper'

class CharacteristicValuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @characteristic_value = characteristic_values(:one)
  end

  test "should get index" do
    get characteristic_values_url
    assert_response :success
  end

  test "should get new" do
    get new_characteristic_value_url
    assert_response :success
  end

  test "should create characteristic_value" do
    assert_difference('CharacteristicValue.count') do
      post characteristic_values_url, params: { characteristic_value: { part_of_characteristic_id: @characteristic_value.part_of_characteristic_id, person_id: @characteristic_value.person_id, time: @characteristic_value.time, value: @characteristic_value.value } }
    end

    assert_redirected_to characteristic_value_url(CharacteristicValue.last)
  end

  test "should show characteristic_value" do
    get characteristic_value_url(@characteristic_value)
    assert_response :success
  end

  test "should get edit" do
    get edit_characteristic_value_url(@characteristic_value)
    assert_response :success
  end

  test "should update characteristic_value" do
    patch characteristic_value_url(@characteristic_value), params: { characteristic_value: { part_of_characteristic_id: @characteristic_value.part_of_characteristic_id, person_id: @characteristic_value.person_id, time: @characteristic_value.time, value: @characteristic_value.value } }
    assert_redirected_to characteristic_value_url(@characteristic_value)
  end

  test "should destroy characteristic_value" do
    assert_difference('CharacteristicValue.count', -1) do
      delete characteristic_value_url(@characteristic_value)
    end

    assert_redirected_to characteristic_values_url
  end
end
