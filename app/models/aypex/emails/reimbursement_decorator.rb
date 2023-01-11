module Aypex
  module Emails
    module ReimbursementDecorator
      def send_reimbursement_email
        Aypex::ReimbursementMailer.reimbursement_email(id).deliver_later
      end

      ::Aypex::Reimbursement.prepend(self)
    end
  end
end
