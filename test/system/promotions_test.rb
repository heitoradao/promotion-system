require 'application_system_test_case'

class PromotionsTest < ApplicationSystemTestCase
  test 'view promotions' do
    # arrange
    create_promotion

    # act
    visit root_path
    click_on 'Promoções'

    # assert
    assert_text 'Promoção teste 1'
    assert_text 'Promoção de teste description'
    assert_text '10%'
    assert_text 'TESTE10'
  end

  test 'view promotion details' do
    create_promotion

    visit root_path
    click_on 'Promoções'
    click_on 'Promoção teste 1'

    # TODO: testar se o redirecionamento aconteceu com sucesso
    assert_text 'Promoção teste 1'
  end

  test 'no promotion are available' do
    visit root_path
    click_on 'Promoções'

    assert_text 'Nenhuma promoção cadastrada'
  end

  test 'view promotions and return to home page' do
    Promotion.create!(name: 'Natal',
                      description: 'Promoção de Natal',
                      code: 'NATAL10',
                      discount_rate: 10,
                      coupon_quantity: 100,
                      expiration_date: '22/12/2033')
    visit root_path
    click_on 'Promoções'
    click_on 'Voltar'

    assert_current_path root_path
  end

  test 'view details and return to promotions page' do
    Promotion.create!(name: 'Natal',
                      description: 'Promoção de Natal',
                      code: 'NATAL10', discount_rate: 10, coupon_quantity: 100,
                      expiration_date: '22/12/2033')
    visit root_path
    click_on 'Promoções'
    click_on 'Natal'
    click_on 'Voltar'

    assert_current_path promotions_path
  end

  test 'create promotion' do
    visit root_path
    click_on 'Promoções'
    click_on 'Criar Promoção'
    fill_in 'Nome', with: 'Cyber Monday'
    fill_in 'Descrição', with: 'Promoção de Cyber Monday'
    fill_in 'Código', with: 'CYBER15'
    fill_in 'Desconto', with: '15'
    fill_in 'Quantidade de cupons', with: '90'
    fill_in 'Data de término', with: '22/12/2033'
    click_on 'Criar promoção'

    # assert_current_path promotion_path(Promotion.last)
    assert_text 'Cyber Monday'
    assert_text 'Promoção de Cyber Monday'
    assert_text '15%'
    assert_text 'CYBER15'
    assert_text '22/12/2033'
    assert_text '90'
    assert_link 'Voltar'
  end

  test 'create and attributes cannot be blank' do
    visit root_path
    click_on 'Promoções'
    click_on 'Criar Promoção'
    click_on 'Criar promoção'

    assert_text 'não pode ficar em branco', count: 5
  end

  test 'name must be unique' do
    create_promotion

    visit root_path
    click_on 'Promoções'
    click_on 'Criar Promoção'
    fill_in 'Nome', with: 'Promoção teste 1'
    fill_in 'Código', with: 'asdfasdfasdf'
    click_on 'Criar promoção'

    assert_text 'já está em uso', count: 1
  end

  test 'code must be unique' do
    create_promotion

    visit root_path
    click_on 'Promoções'
    click_on 'Criar Promoção'
    fill_in 'Nome', with: 'asdfasdffasdf'
    fill_in 'Código', with: 'TESTE10'
    click_on 'Criar promoção'

    assert_text 'já está em uso', count: 1
  end

  test 'generate coupons for a promotion' do
    promotion = create_promotion

    visit promotion_path(promotion)
    click_on 'Gerar cupons'

    assert_text 'Cupons gerados com sucesso'
    #assert_no_link 'Gerar cupons'
  end

  test 'coupons generated follows a specific pattern' do
    promotion = create_promotion

    visit promotion_path(promotion)
    click_on 'Gerar cupons'
    assert_no_text 'TESTE10-0000'
    assert_text 'TESTE10-0001 (ativo)'
    assert_text 'TESTE10-0002 (ativo)'
    assert_text 'TESTE10-0100 (ativo)'
    assert_no_text 'TESTE10-0101'
    assert_link 'Desabilitar', count: 100
  end

  private

  def create_promotion
    promotion = Promotion.create!(       name: 'Promoção teste 1',
                                  description: 'Promoção de teste description',
                                         code: 'TESTE10',
                                discount_rate: 10,
                              coupon_quantity: 100,
                              expiration_date: '10/10/2022')
  end
end
