Fabricator(:promotion) do
  name 'Natal'
  code "NATAL10"
  discount_rate 15
  coupon_quantity 100
  expiration_date 10.days.from_now
  user
end
