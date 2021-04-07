require "application_system_test_case"

class CategoriaProdutosTest < ApplicationSystemTestCase
  setup do
    @categoria_produto = categoria_produtos(:one)
  end

  test "visiting the index" do
    visit categoria_produtos_url
    assert_selector "h1", text: "Categoria Produtos"
  end

  test "creating a Categoria produto" do
    visit categoria_produtos_url
    click_on "New Categoria Produto"

    fill_in "Promotions", with: @categoria_produto.promotions_id
    fill_in "Title", with: @categoria_produto.title
    click_on "Create Categoria produto"

    assert_text "Categoria produto was successfully created"
    click_on "Back"
  end

  test "updating a Categoria produto" do
    visit categoria_produtos_url
    click_on "Edit", match: :first

    fill_in "Promotions", with: @categoria_produto.promotions_id
    fill_in "Title", with: @categoria_produto.title
    click_on "Update Categoria produto"

    assert_text "Categoria produto was successfully updated"
    click_on "Back"
  end

  test "destroying a Categoria produto" do
    visit categoria_produtos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Categoria produto was successfully destroyed"
  end
end
