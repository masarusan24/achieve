class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to: contact.email, subject: "#{contact.name}さんからのお問い合わせ"
  end
end
