module Aypex
  class OrderMailer < BaseMailer
    def confirm_email(order, resend = false)
      @order = order.respond_to?(:id) ? order : Aypex::Order.find(order)
      current_store = @order.store
      subject = (resend ? "[#{Aypex.t(:resend).upcase}] " : "")
      subject += "#{current_store.name} #{Aypex.t("order_mailer.confirm_email.subject")} ##{@order.number}"
      mail(to: @order.email, from: from_address, subject: subject, store_url: current_store.url, reply_to: reply_to_address)
    end

    def store_owner_notification_email(order)
      @order = order.respond_to?(:id) ? order : Aypex::Order.find(order)
      current_store = @order.store
      subject = Aypex.t("order_mailer.store_owner_notification_email.subject", store_name: current_store.name)
      mail(to: current_store.new_order_notifications_email, from: from_address, subject: subject, store_url: current_store.url, reply_to: reply_to_address)
    end

    def cancel_email(order, resend = false)
      @order = order.respond_to?(:id) ? order : Aypex::Order.find(order)
      current_store = @order.store
      subject = (resend ? "[#{Aypex.t(:resend).upcase}] " : "")
      subject += "#{current_store.name} #{Aypex.t("order_mailer.cancel_email.subject")} ##{@order.number}"
      mail(to: @order.email, from: from_address, subject: subject, store_url: current_store.url, reply_to: reply_to_address)
    end
  end
end
