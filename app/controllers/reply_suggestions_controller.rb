# frozen_string_literal: true

class ReplySuggestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_suggestion, only: :create

  def create
    service = SendReplySuggestionService.new(@suggestion, permitted_params)
    service.execute!

    respond_to do |format|
      format.html { redirect_to @suggestion, notice: 'Envíado exitosamente!' }
      format.html { head :no_content }
    end
  end

  private

  def find_suggestion
    @suggestion = Suggestion.find(params[:suggestion_id])
  end

  def permitted_params
    params.permit(:message)
  end
end
