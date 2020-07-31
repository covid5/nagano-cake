require 'test_helper'

class Member::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get member_orders_new_url
    assert_response :success
  end

  test "should get confirm" do
    get member_orders_confirm_url
    assert_response :success
  end

  test "should get create" do
    get member_orders_create_url
    assert_response :success
  end

  test "should get thank" do
    get member_orders_thank_url
    assert_response :success
  end

end
