class MarketingMailer < ApplicationMailer
  def campaign(client, title, body)
    @body = body
    mail to: client.email, subject: title
  end
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.marketing_mailer.send.subject
  #
  def send
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
