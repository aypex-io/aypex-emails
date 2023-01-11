module Aypex
  class ShipmentMailer < BaseMailer
    def shipped_email(shipment, resend = false)
      @shipment = shipment.respond_to?(:id) ? shipment : Aypex::Shipment.find(shipment)
      @order = @shipment.order
      current_store = @shipment.store
      subject = (resend ? "[#{Aypex.t(:resend).upcase}] " : "")
      subject += "#{current_store.name} #{Aypex.t("shipment_mailer.shipped_email.subject")} ##{@order.number}"
      mail(to: @order.email, from: from_address, subject: subject, store_url: current_store.url, reply_to: reply_to_address)
    end
  end
end
