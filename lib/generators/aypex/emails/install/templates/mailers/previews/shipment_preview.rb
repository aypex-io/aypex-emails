class ShipmentPreview < ActionMailer::Preview
  def shipped_email
    Aypex::ShipmentMailer.shipped_email(Aypex::Shipment.shipped.first)
  end
end
