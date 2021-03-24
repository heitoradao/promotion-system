class PromotionsController < ApplicationController

  before_action :set_promotion, only: %i[show generate_coupons edit]

  def index
    @promotions = Promotion.all
  end

  def show
    
  end

  def generate_coupons
    @promotion.generate_coupons!
    redirect_to @promotion, notice: t('.success')
  end

  def new
    @promotion = Promotion.new
  end

  def create
    @promotion = Promotion.new(promotion_params)
    if @promotion.save
      redirect_to @promotion
    else
      render :new
    end
  end

  def edit
  end

  private

    def promotion_params
      params
        .require(:promotion)
        .permit(:name, :expiration_date, :description,
                :discount_rate, :code, :coupon_quantity)
    end

    def set_promotion
      @promotion = Promotion.find(params[:id])
    end
end
