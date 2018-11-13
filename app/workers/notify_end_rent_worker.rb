require 'sidekiq-scheduler'

class NotifyEndRentWorker
  include Sidekiq::Worker

  def perform
    logger.info 'Verifying rents...'
    Rent.where('end_date <= ? AND notified = ?', Time.zone.now, false).each do |rent|
      logger.info "Rent ID #{rent.id}"
      NotifyMailer.notify(rent.id).deliver_now
      rent.update(notified: true)
    end
    logger.info 'Finish.'
  end
end
