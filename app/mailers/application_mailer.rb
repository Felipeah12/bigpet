# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  SENDER_NAME = 'Bigpetco'
  SENDER_EMAIL = 'no_reply@bigpetco.com'

  default from: "\"#{SENDER_NAME}\" <#{SENDER_EMAIL}>"
  layout 'mailer'

  before_action :set_metadata

  def set_metadata
    headers['X-MC-Metadata'] = {
      customer_id: (params || {}).dig(:customer_id),
      template_id: "#{mailer_name}/#{action_name}"
    }.to_json
  end
end
