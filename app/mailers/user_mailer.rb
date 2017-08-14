class UserMailer < ApplicationMailer

  def order_confirm_email(user, cart)
    @user = user
    @cart = cart
    mail(to: @user.email, subject: "Благодарим за заказ/Thank you for your order")
  end
end
