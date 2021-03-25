class SuggestionsController < ApplicationController
  before_action :authenticate_user!, only: %i[index show]
  before_action :find_suggestion, only: %i[show destroy]

  def index
    @suggestions = Suggestion.active.sort_created_at
  end

  def show; end

  def new
    @suggestion = Suggestion.new
  end

  def create
    @suggestion = Suggestion.new(suggestion_params)

    respond_to do |format|
      if @suggestion.save
        format.html { redirect_to new_suggestion_path, notice: t('notice.notification') }
        format.json { render :show, status: :created, location: @suggestion }
      else
        format.html { render :new }
        format.json { render json: @suggestion.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @suggestion.soft_delete!

    respond_to do |format|
      format.html { redirect_to suggestions_url, notice: 'PQRS archivado exitosamente!' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def find_suggestion
    @suggestion = Suggestion.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def suggestion_params
    params.require(:suggestion).permit(:email, :phone, :question)
  end
end
