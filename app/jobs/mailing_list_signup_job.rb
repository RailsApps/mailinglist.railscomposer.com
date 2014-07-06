class MailingListSignupJob < ActiveJob::Base

  def perform(email)
    subscribe(email)
  end

  def subscribe(email)
    mailchimp = Gibbon::API.new(Rails.application.secrets.mailchimp_api_key)
    result = mailchimp.lists.subscribe({
      :id => Rails.application.secrets.mailchimp_list_id,
      :email => {:email => email},
      :double_optin => true,
      :update_existing => true,
      :send_welcome => true
    })
    Rails.logger.info("\nSubscribed #{email} to MailChimp") if result
  end

end
