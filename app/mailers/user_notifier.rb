class UserNotifier < ApplicationMailer
  def send_link(current_user, recipient, link)
    @user = current_user
    @recipient = recipient
    @link = link
    mail(to: @recipient,
    subject: "#{@user.email} sent a link to you!")
  end
end
