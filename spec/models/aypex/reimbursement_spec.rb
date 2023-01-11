require "spec_helper"

describe Aypex::Reimbursement, type: :model do
  describe "#perform!" do
    subject { reimbursement.perform! }

    let!(:adjustments) { [] } # placeholder to ensure it gets run prior the "before" at this level

    let!(:tax_rate) { nil }
    let!(:tax_zone) { create(:zone_with_country, default_tax: true) }

    let(:store) { create(:store) }
    let(:order) { create(:shipped_order, line_items_count: 1, line_items_price: line_items_price, shipment_cost: 0, store: store) }
    let(:line_items_price) { BigDecimal("10") }
    let(:line_item) { order.line_items.first }
    let(:inventory_unit) { line_item.inventory_units.first }
    let(:payment) { order.payments.first }
    let(:payment_amount) { order.total }
    let(:customer_return) { build(:customer_return, return_items: [return_item], store: store) }
    let(:return_item) { build(:return_item, inventory_unit: inventory_unit) }

    let!(:default_refund_reason) { Aypex::RefundReason.find_or_create_by!(name: Aypex::RefundReason::RETURN_PROCESSING_REASON, mutable: false) }

    let(:reimbursement) { create(:reimbursement, customer_return: customer_return, order: order, return_items: [return_item]) }

    let(:store_credit_reimbursement_type) { create(:reimbursement_type, name: "StoreCredit", type: "Aypex::ReimbursementType::StoreCredit") }

    before do
      customer_return.save!
      return_item.accept!
    end

    it "triggers the reimbursement mailer to be sent" do
      expect(Aypex::ReimbursementMailer).to receive(:reimbursement_email).with(reimbursement.id) { double(deliver_later: true) }
      subject
    end
  end
end
