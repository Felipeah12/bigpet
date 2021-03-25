# frozen_string_literal: true

class LeedsController < ApplicationController
  before_action :authenticate_user!, except: :create

  def index
    @leeds = Leed.sort_created_at
  end

  def create
    @leed = Leed.new
    service = ::LeedCreationService.new(@leed, leed_parameters)

    respond_to do |format|
      service.execute!

      format.json { render :index, status: :created, location: @leed }
      format.html { redirect_to home_path, notice: 'Suscribción exitosa.' }
    end
  end

  private

  def unprocessable_entity
    respond_to do |format|
      format.html { redirect_to home_path, notice: @leed.errors.full_messages.first }
      format.json { render json: @leed.errors.full_messages, status: __method__ }
    end
  end

  def leed_parameters
    params.require(:leed).permit(:name, :email, :status)
  end
end
