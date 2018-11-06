class SendMailWorker
  include Sidekiq::Worker

  def perform(rent_id)
    logger.info 'Sending email...'
    RentCreatedMailer.created(rent_id).deliver_now
    logger.info 'Finish.'
  end
end
