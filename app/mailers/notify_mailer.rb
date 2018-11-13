class NotifyMailer < ApplicationMailer
  default from: 'jorge.diaz@wolox.com'

  def notify(rent_id)
    @current_rent = Rent.find(rent_id)

    I18n.with_locale(set_locale) do
      mail(to: @current_rent.user.email, subject: I18n.t(:subject_notify_email))
    end
  end

  private

  def set_locale
    @current_rent.user&.locale || I18n.locale_default
  end
end
