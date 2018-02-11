class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to: contact.email, subject: "#{contact.name}さんからのお問い合わせ"
  end

  def create_blog_mail(blog)
    @blog = blog
    user = User.find(blog.user_id)
    mail to: user.email, subject: "#{user.name}さんのブログを作成しました"
  end
end
