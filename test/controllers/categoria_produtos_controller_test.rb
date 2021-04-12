require "test_helper"

class CategoriaProdutosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @categoria_produto = categoria_produtos(:one)
  end

  test "should get index" do
    get categoria_produtos_url
    assert_response :success
  end

  test "should get new" do
    get new_categoria_produto_url
    assert_response :success
  end

  test "should create categoria_produto" do
    assert_difference('CategoriaProduto.count') do
      post categoria_produtos_url, params: { categoria_produto: { promotions_id: @categoria_produto.promotions_id, title: @categoria_produto.title } }
    end

    assert_redirected_to categoria_produto_url(CategoriaProduto.last)
  end

  test "should show categoria_produto" do
    get categoria_produto_url(@categoria_produto)
    assert_response :success
  end

  test "should get edit" do
    get edit_categoria_produto_url(@categoria_produto)
    assert_response :success
  end

  test "should update categoria_produto" do
    patch categoria_produto_url(@categoria_produto), params: { categoria_produto: { promotions_id: @categoria_produto.promotions_id, title: @categoria_produto.title } }
    assert_redirected_to categoria_produto_url(@categoria_produto)
  end

  test "should destroy categoria_produto" do
    assert_difference('CategoriaProduto.count', -1) do
      delete categoria_produto_url(@categoria_produto)
    end

    assert_redirected_to categoria_produtos_url
  end
end
