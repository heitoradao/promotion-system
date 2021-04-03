require "test_helper"

class PromotionTest < ActiveSupport::TestCase
  test 'this test can create a valid Promotion' do
    promotion = create_a_valid_promotion_without_save_it
    assert promotion.valid?
  end

  test 'attributes cannot be blank' do
    promotion = Promotion.new

    refute promotion.valid?

    assert_includes promotion.errors[:name], 'não pode ficar em branco'
    assert_includes promotion.errors[:code], 'não pode ficar em branco'
    assert_includes promotion.errors[:discount_rate], 'não pode ficar em branco'
    assert_includes promotion.errors[:coupon_quantity], 'não pode ficar em branco'
    assert_includes promotion.errors[:expiration_date], 'não pode ficar em branco'
  end

  test "should not save promotion without title" do
    promotion = create_a_valid_promotion_without_save_it
    promotion.name = nil
    assert_not promotion.save, "Saved the promotion without a name"
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


  private

    def create_a_valid_promotion_without_save_it
      user = User.create(email: 'jane.doe@iugu.com.br', password: '123456')

      promotion = Promotion.new
      promotion.name = 'Páscoa Maluca'
      promotion.description = 'Promoção de Páscoa'
      promotion.code = 'PASCOA20'
      promotion.discount_rate = 20
      promotion.coupon_quantity = 200
      promotion.expiration_date = '20/04/2021'
      promotion.user = user

      promotion
    end
end
