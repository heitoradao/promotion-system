# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

john = User.create!(email: 'john.doe@iugu.com.br',
                    password: '123456')

natal = Promotion.create!(name:'Natal',
                          description: 'Promoção de Natal',
                          code: 'NATAL10',
                          discount_rate: 10,
                          coupon_quantity: 100,
                          expiration_date: '22/12/2033',
                          user: john)

cyber = Promotion.create!(name: 'Cyber Monday',
                          coupon_quantity: 90,
                          description: 'Promoção de Cyber Monday',
                          code: 'CYBER15',
                          discount_rate: 15,
                          expiration_date: '22/12/2033',
                          user: john)
