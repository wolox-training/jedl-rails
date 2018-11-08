# Preview all emails at http://localhost:3000/rails/mailers/rent_created_mailer
class RentCreatedMailerPreview < ActionMailer::Preview
  def created
    RentCreatedMailer.created(Rent.first.id)
  end
end
