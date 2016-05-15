require 'test_helper'
class ApiControllerTest < ActionController::TestCase
  test "contar posts token malo" do
  	numero = ApiController.new().contar_post_api('pikachu', '123alguntoken')
    assert_nil(numero, 'malo')
  end
  test "contar posts" do
  	numero = ApiController.new().contar_post_api('pikachu', '2019746130.59a3f2b.86a0135240404ed5b908a14c0a2d9402')
    assert_not_nil(numero, 'malo')
  end
  test "obtener post token malo" do
  	get :obtener_post_api, :tag => 'pokemon', :access_token => '2002alguntoken'
    assert_response :bad_request
  end

  test "obtener post sin token" do
  	get :obtener_post_api, :tag => 'pokemon', :access_token => ''
    assert_response :bad_request
  end
  test "obtener post" do
  	get :obtener_post_api, :tag => 'pokemon', :access_token => '2019746130.59a3f2b.86a0135240404ed5b908a14c0a2d9402',format: :json
    assert_response :success
  end
end
