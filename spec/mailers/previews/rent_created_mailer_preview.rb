# Preview all emails at http://localhost:3000/rails/mailers/rent_created_mailer
class RentCreatedMailerPreview < ActionMailer::Preview
    def created
        RentCreatedMailer.with(user: User.first, book: Book.first, rent: Rent.first).created
    end
end
