class RentCreatedMailer < ApplicationMailer
  default from: 'jorge.diaz@wolox.com'

  def created(rent_id)
    @current_rent = Rent.find(rent_id)
    mail(to: @current_rent.user.email, subject: 'Created rent data')
  end
end
