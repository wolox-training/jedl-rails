class RentCreatedMailer < ApplicationMailer
    default from: "jorge.diaz@wolox.com"

    def created
        @user = params[:user]
        @book = params[:book]
        @rent = params[:rent]
        mail(to: @user.email, subject: "Created rent data")
    end
end
