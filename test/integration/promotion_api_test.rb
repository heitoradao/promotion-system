require 'test_helper'

class PromotionApiTest < ActionDispatch::IntegrationTest
  test 'should get a successful answer for /api/v1/coupon' do
    user = User.create!(email: 'test@iugu.com.br',
                        password: '123456')
    promotion = Promotion.create!(name: 'Natal',
                                  description: 'Promoção de natal',
                                  code: 'NATAL10',
                                  discount_rate: 15,
                                  coupon_quantity: 5,
                                  expiration_date: '22/12/2033',
                                  user: user)
    coupon = Coupon.create!(code: 'NATAL10',
                            promotion: promotion)

    get "/api/v1/coupons/#{coupon.code}"
    assert_response :success
  end
end
