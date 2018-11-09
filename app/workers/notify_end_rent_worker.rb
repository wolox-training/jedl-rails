require 'sidekiq-scheduler'

class NotifyEndRentWorker
  include Sidekiq::Worker

  def perform
    logger.info 'Verifying rents...'
    Rent.where(end_date: Time.zone.now).pluck(:id).each do |rent_id|
      logger.info "Rent ID #{rent_id}"
      NotifyMailer.notify(rent_id).deliver_now
    end
    logger.info 'Finish.'
  end
end
