require 'test_helper'

class CouponsControllerTest < ActionController::TestCase

  # :success - Status code was in the 200-299 range
  # :redirect - Status code was in the 300-399 range
  # :missing - Status code was 404
  # :error - Status code was in the 500-599 range



  test 'should get show' do
    assert_response :success
  end

  test 'should get create' do
    assert_response :success
  end

  test 'should get new' do
    # se usuário tiver logado
    assert_response :success
    # caso contrário, precisa dar erro
  end
end
