class OrderConfirm < ActionMailer::Base
  default from: "acsd68500@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_confirm.confirm.subject
  #
  def confirm(order)
    @order = order
    @user = @order.user
    email = @user.email
    @total = @order.total

    @message = "Thank you for order"

    mail(:to => email, :subject => "Order confirm")
  end
end
