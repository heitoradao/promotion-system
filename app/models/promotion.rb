class Promotion < ApplicationRecord
  has_many :coupon

  validates :name, :code, :discount_rate, :coupon_quantity,
            :expiration_date, presence: { message: 'não pode ficar em branco' }
  validates :code, :name, uniqueness: { message: 'deve ser único' }

  validate :expiration_date_cannot_be_in_the_past

  def generate_coupons!
    return if coupons.any?

    (1..coupon_quantity).each do |number|
      coupons.create!(code: "#{code}-#{'%04d' % number}" )
    end
  end

  private

  def expiration_date_cannot_be_in_the_past
    #return unless expiration_date.present? && 
  end
end
