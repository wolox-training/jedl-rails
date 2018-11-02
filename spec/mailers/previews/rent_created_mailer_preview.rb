# Preview all emails at http://localhost:3000/rails/mailers/rent_created_mailer
class RentCreatedMailerPreview < ActionMailer::Preview
    def created
        RentCreatedMailer.with(current_rent: Rent.first).created
    end
end
