Fabricator(:coupon) do
  code { sequence(:code) {|i| "NATAL10-#{ '%04d' % i }" } }
  before_save do |coupon, transient|
    coupon.code = "#{coupon.promotion.code}-#{'%04d' % coupon.code}"
  end
end
