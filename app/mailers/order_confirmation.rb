class OrderConfirmation < ActionMailer::Base
  default from: "HorschGallery <horschgallery@gmail.com>"

  def received(order)
    @order = order
    @line_items = @order.line_items
    mail to: "#{order.first_name_bill.capitalize} #{order.last_name_bill.capitalize} <hgtest9999@gmail.com>", subject: "Thanks for your HorschGallery Order. Order# #{order.id}"
  end
end
