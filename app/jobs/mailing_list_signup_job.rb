class MailingListSignupJob < ActiveJob::Base

  def perform(visitor)
    visitor.subscribe
  end

end
