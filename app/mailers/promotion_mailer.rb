class PromotionMailer < ApplicationMailer
  def approval_email(promotion)
    @promotion = promotion
    mail(to: 'heitor.adao@gmail.com'
         subject: 'Promoção aprovada')
  end
end
