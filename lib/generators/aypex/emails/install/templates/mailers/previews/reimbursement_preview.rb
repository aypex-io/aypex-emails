class ReimbursementPreview < ActionMailer::Preview
  def reimbursement_email
    Aypex::ReimbursementMailer.reimbursement_email(Aypex::Reimbursement.first)
  end
end
