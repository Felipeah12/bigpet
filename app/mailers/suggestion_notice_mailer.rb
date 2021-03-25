# frozen_string_literal: true

class SuggestionNoticeMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   [en, es].mailer.suggestion.reply.subject
  #
  def reply(email, message)
    @email = email.split('@')[0].humanize
    @message = message

    mail to: email, subject: I18n.t('mailer.suggestion.reply.subject')
  end
end
