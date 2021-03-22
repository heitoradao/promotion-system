class PromotionsController < ApplicationController
  def index
    @promotions = Promotion.all
  end

  def show
    @promotion = Promotion.find(params[:id])
  end

  def generate_coupons
    @promotion = Promotion.find(params[:id])

    (1..@promotion.coupon_quantity).each do |number|
      Coupon.create!(code: "#{@promotion.code}-#{'%04d' % number}", promotion: @promotion)

      flash[:notice] = 'Cupons gerados com sucesso'
      redirect_to @promotion
    end
  end
end
