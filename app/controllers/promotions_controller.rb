class PromotionsController < ApplicationController

  before_action :set_promotion, only: [:show, :generate_coupons]

  def index
    @promotions = Promotion.all
  end

  def show
    @promotion = Promotion.find(params[:id])
  end

  def generate_coupons
    @promotion = Promotion.find(params[:id])
    @promotion.generate_coupons!
    flash[:notice] = 'Cupons gerados com sucesso'
    redirect_to @promotion
  end

  def new
    @promotion = Promotion.find(params[:id])
  end
end
