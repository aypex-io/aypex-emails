module Aypex
  module Emails
    module ShipmentHandlerDecorator
      protected

      def send_shipped_email
        ShipmentMailer.shipped_email(@shipment.id).deliver_later
      end

      ::Aypex::ShipmentHandler.prepend(self)
    end
  end
end
