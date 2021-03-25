# frozen_string_literal: true

class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_purchase, only: :show

  def index
    @purchases = Order.sort_created_at
  end

  def show; end

  private

  def find_purchase
    @purchase = Order.find(params[:id])
  end
end
