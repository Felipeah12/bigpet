# frozen_string_literal: true

class SendReplySuggestionService
  def initialize(suggestion, params)
    @suggestion = suggestion
    @params = params
  end

  def execute!
    SuggestionNoticeMailer.reply(@suggestion.email, params[:message]).deliver_now
    true
  end

  private

  attr_reader :suggestion, :params
end
