class Api::V1::CouponsController < Api::V1::ApiController
  def show
    @coupon = Coupon.find_by!(code: params[:id])
    render json: @coupon
  rescue ActiveRecord::RcordNotFound
    head 404
  end
end
