class OrderPreview < ActionMailer::Preview
  def confirm_email
    Aypex::OrderMailer.confirm_email(Aypex::Order.complete.first)
  end

  def cancel_email
    Aypex::OrderMailer.cancel_email(Aypex::Order.complete.first)
  end

  def store_owner_notification_email
    Aypex::OrderMailer.store_owner_notification_email(Aypex::Order.complete.first)
  end
end
