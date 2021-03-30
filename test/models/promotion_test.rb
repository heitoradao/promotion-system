require "test_helper"

class PromotionTest < ActiveSupport::TestCase
  test 'attributes cannot be blank' do
    promotion = Promotion.new

    refute promotion.valid?

    assert_includes promotion.errors[:name], 'não pode ficar em branco'
    assert_includes promotion.errors[:code], 'não pode ficar em branco'
    assert_includes promotion.errors[:discount_rate], 'não pode ficar em branco'
    assert_includes promotion.errors[:coupon_quantity], 'não pode ficar em branco'
    assert_includes promotion.errors[:expiration_date], 'não pode ficar em branco'
  end


  test 'code must be uniq' do
    # precisa carregar o seed pra esse teste ser válido
    Promotion.create!(           name: 'asdfqwer',
                          description: 'Promoção de asdfqwer',
                                 code: 'NATAL10',
                        discount_rate: 123,
                      coupon_quantity: 456,
                      expiration_date: '22/01/2333'         )
    promotion = Promotion.new(code: 'NATAL10')

    refute promotion.valid?
    assert_includes promotion.errors[:code], 'já está em uso'
  end


  test 'name must be uniq' do
    Promotion.create!(           name: 'Natal',
                          description: 'Promoção de asdfasdfa',
                                 code: 'sdfasdfasdf',
                        discount_rate: 10,
                      coupon_quantity: 100,
                      expiration_date: '22/12/2033'        )
    promotion = Promotion.new(name: 'Natal')

    refute promotion.valid?
    assert_includes promotion.errors[:name], 'já está em uso'
  end
end
