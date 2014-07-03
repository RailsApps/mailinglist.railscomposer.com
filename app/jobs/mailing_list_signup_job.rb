class MailingListSignupJob < ActiveJob::Base

  def perform(visitor)
    logger.info "\n\n\033[1;34;40m signed up #{visitor.email}\033[0m"
    visitor.subscribe
  end

end
