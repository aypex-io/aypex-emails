module Aypex
  class ReimbursementMailer < BaseMailer
    def reimbursement_email(reimbursement, resend = false)
      @reimbursement = reimbursement.respond_to?(:id) ? reimbursement : Aypex::Reimbursement.find(reimbursement)
      @order = @reimbursement.order
      current_store = @reimbursement.store || Aypex::Store.default
      subject = (resend ? "[#{Aypex.t(:resend).upcase}] " : "")
      subject += "#{current_store.name} #{Aypex.t("reimbursement_mailer.reimbursement_email.subject")} ##{@order.number}"
      mail(to: @order.email, from: from_address, subject: subject, store_url: current_store.url, reply_to: reply_to_address)
    end
  end
end
