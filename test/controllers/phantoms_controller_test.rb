require 'test_helper'

class PhantomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @phantom = phantoms(:one)
  end

  test "should get index" do
    get phantoms_url
    assert_response :success
  end

  test "should get new" do
    get new_phantom_url
    assert_response :success
  end

  test "should create phantom" do
    assert_difference('Phantom.count') do
      post phantoms_url, params: { phantom: {  } }
    end

    assert_redirected_to phantom_url(Phantom.last)
  end

  test "should show phantom" do
    get phantom_url(@phantom)
    assert_response :success
  end

  test "should get edit" do
    get edit_phantom_url(@phantom)
    assert_response :success
  end

  test "should update phantom" do
    patch phantom_url(@phantom), params: { phantom: {  } }
    assert_redirected_to phantom_url(@phantom)
  end

  test "should destroy phantom" do
    assert_difference('Phantom.count', -1) do
      delete phantom_url(@phantom)
    end

    assert_redirected_to phantoms_url
  end
end
