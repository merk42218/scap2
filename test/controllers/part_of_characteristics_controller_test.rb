require 'test_helper'

class PartOfCharacteristicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @part_of_characteristic = part_of_characteristics(:one)
  end

  test "should get index" do
    get part_of_characteristics_url
    assert_response :success
  end

  test "should get new" do
    get new_part_of_characteristic_url
    assert_response :success
  end

  test "should create part_of_characteristic" do
    assert_difference('PartOfCharacteristic.count') do
      post part_of_characteristics_url, params: { part_of_characteristic: { characteristic_id: @part_of_characteristic.characteristic_id, isweight: @part_of_characteristic.isweight, partname: @part_of_characteristic.partname } }
    end

    assert_redirected_to part_of_characteristic_url(PartOfCharacteristic.last)
  end

  test "should show part_of_characteristic" do
    get part_of_characteristic_url(@part_of_characteristic)
    assert_response :success
  end

  test "should get edit" do
    get edit_part_of_characteristic_url(@part_of_characteristic)
    assert_response :success
  end

  test "should update part_of_characteristic" do
    patch part_of_characteristic_url(@part_of_characteristic), params: { part_of_characteristic: { characteristic_id: @part_of_characteristic.characteristic_id, isweight: @part_of_characteristic.isweight, partname: @part_of_characteristic.partname } }
    assert_redirected_to part_of_characteristic_url(@part_of_characteristic)
  end

  test "should destroy part_of_characteristic" do
    assert_difference('PartOfCharacteristic.count', -1) do
      delete part_of_characteristic_url(@part_of_characteristic)
    end

    assert_redirected_to part_of_characteristics_url
  end
end
