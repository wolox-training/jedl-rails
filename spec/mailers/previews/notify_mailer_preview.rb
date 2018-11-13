# Preview all emails at http://localhost:3000/rails/mailers/notify_mailer
class NotifyMailerPreview < ActionMailer::Preview
  def notify
    NotifyMailer.notify(Rent.first.id)
  end
end
