require "spec_helper"

describe Aypex::TestMailer, type: :mailer do
  include EmailSpec::Helpers
  include EmailSpec::Matchers

  before { create(:store) }

  let(:user) { create(:user) }

  context ":from not set explicitly" do
    it "falls back to aypex config" do
      message = Aypex::TestMailer.test_email("test@example.com")
      expect(message.from).to eq([Aypex::Store.default.mail_from_address])
    end
  end

  it "confirm_email accepts a user id as an alternative to a User object" do
    expect do
      Aypex::TestMailer.test_email("test@example.com")
    end.not_to raise_error
  end

  context "action mailer host" do
    it "falls back to aypex store url" do
      ActionMailer::Base.default_url_options = {}
      Aypex::TestMailer.test_email("test@example.com").deliver_now
      expect(ActionMailer::Base.default_url_options[:host]).to eq(Aypex::Store.default.url)
    end

    it "uses developer set host" do
      ActionMailer::Base.default_url_options[:host] = "test.test"
      Aypex::TestMailer.test_email("test@example.com").deliver_now
      expect(ActionMailer::Base.default_url_options[:host]).to eq("test.test")
    end
  end
end
