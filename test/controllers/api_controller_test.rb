require 'test_helper'
require_relative "../../SimpleNumber"
class ApiControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end
  test 'suma' do
  	assert_equal(4, SimpleNumber.new(2).add(2) )
  	assert_equal(6, SimpleNumber.new(4).add(2) )
    assert_equal(9, SimpleNumber.new(3).multiply(3), "Has fallado")
  end
  #test "obtener_post_api" do
  #  get :obtener_post_api
  #  assert_response :success
  #end
end
