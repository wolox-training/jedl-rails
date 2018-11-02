class SendMailWorker
    include Sidekiq::Worker

    def perform(rent_id)
        puts "Sending email..."
        #RentCreatedMailer.with(current_rent).created
        RentCreatedMailer.created(rent_id).deliver_now
        puts "Finish."
    end
end