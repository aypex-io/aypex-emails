class UserPreview < ActionMailer::Preview
  def reset_password_instructions
    Aypex::UserMailer.reset_password_instructions(Aypex.user_class.first, "your_token", {current_store_id: Aypex::Store.default.id})
  end

  if Aypex::Auth::Config.confirmable
    def confirmation_instructions
      Aypex::UserMailer.confirmation_instructions(Aypex.user_class.first, "your_token")
    end
  end
end
