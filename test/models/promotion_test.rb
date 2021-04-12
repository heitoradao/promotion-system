require "test_helper"

class PromotionTest < ActiveSupport::TestCase
  test 'this test can create a valid Promotion' do
    promotion = create_a_valid_promotion
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
    promotion = create_a_valid_promotion
    promotion.name = nil
    refute promotion.save
  end


  test 'fabrication deveria conseguir gerar uma promotion válida' do
    p = Fabricate(:promotion)
    assert_instance_of(Promotion, p)
    assert p.valid?
  end


  test 'attributes must be uniq' do

    Fabricate(:promotion)

    user = create_user
    first = create_a_valid_promotion(user)
    assert first.valid?

    assert_raise do
      create_a_valid_promotion(user)
    end
  end


  private

    def create_a_valid_promotion(user = create_user)
      Promotion.create!(name: 'Páscoa Maluca',
                        description: 'Promoção de Páscoa',
                        code: 'PASCOA20',
                        discount_rate: 20,
                        coupon_quantity: 200,
                        expiration_date: '20/04/2021',
                        user: user)
    end

    def create_user
      User.create!(email: 'jane.doe@iugu.com.br',
                   password: '123456')
    end
end
