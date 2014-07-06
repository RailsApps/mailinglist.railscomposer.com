class ApiController < ApplicationController

  skip_before_action :verify_authenticity_token

  def create
    @visitor = Visitor.new(secure_params)
    if @visitor.valid?
      MailingListSignupJob.enqueue @visitor.email
      head :created
    else
      head :internal_server_error
    end
  end

  private

  def secure_params
    params.require(:visitor).permit(:email)
  end

end
