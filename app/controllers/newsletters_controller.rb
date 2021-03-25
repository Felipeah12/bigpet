# frozen_string_literal: true

class NewslettersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_newsletter, only: %i[show edit update destroy]

  def index
    @newsletters = Newsletter.all
  end

  def show; end

  def new
    @newsletter = Newsletter.new
  end

  def edit; end

  def create
    @newsletter = Newsletter.new(newsletter_params)

    respond_to do |format|
      if @newsletter.save
        format.html { redirect_to newsletters_path, notice: 'Noticia creada exitosamente!' }
        format.json { render :show, status: :created, location: @newsletter }
      else
        format.html { render :new }
        format.json { render json: @newsletter.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @newsletter.update(newsletter_params)
        format.html { redirect_to newsletters_path, notice: 'Noticia actualizada exitosamente!' }
        format.json { render :show, status: :ok, location: @newsletter }
      else
        format.html { render :edit }
        format.json { render json: @newsletter.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    notice = 'Noticia NO publicada!'
    @newsletter.published? ? @newsletter.unpublished! : @newsletter.published!

    respond_to do |format|
      notice = 'Noticia publicada!' if @newsletter.published?
      format.html { redirect_to newsletters_url, notice: notice }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def find_newsletter
    @newsletter = Newsletter.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def newsletter_params
    params.require(:newsletter).permit(:title, :status, :content, :image)
  end
end
