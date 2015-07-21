class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account activation"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
  end


  def send_bill(user, current_channel)
    @user = user
    @user_channel ||= Order.where(channel_id: current_channel.id)
    @user_order ||= @user_channel.where(user_id: user.id)
    mail to: user.email, subject: "Supper Costs"
  end 
end
