require 'test_helper'

class PromotionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @controller = PromotionsController.new
    @promotion = create_a_valid_promotion
    #@first = Promotion.find(2)
  end

  test 'should get show' do
    get promotion_path(2)
    assert_response :success
    byebug
    assert_equal @response.body, "Cyber"
  end

  test 'should get index' do
    get promotions_path
    assert_response :success
  end

  test 'should get new' do
    #assert_response :success
  end

  test 'should get destroy' do
    #assert_response :success
  end



  private

  def create_a_valid_promotion
    promotion = Promotion.new
    promotion.name = 'Páscoa Maluca'
    promotion.description = 'Promoção de Páscoa'
    promotion.code = 'PASCOA20'
    promotion.discount_rate = 20
    promotion.coupon_quantity = 200
    promotion.expiration_date = '20/04/2021'

    promotion
  end
end
