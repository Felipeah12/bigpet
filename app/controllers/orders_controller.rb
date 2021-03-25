# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_brand, only: %i[create update]
  before_action :find_user, only: :destroy
  before_action :find_order, only: %i[show destroy]

  def index; end

  def show; end

  def create
    @order = draft_order
    service = OrderCreationService.new(order: @order, brand: @brand, user: current_user, params: params)

    respond_to do |format|
      generate_order_collection(params) if service.execute!

      format.json { head :no_content }
      format.html { redirect_to [current_user, @order], notice: 'Estás a un paso de terminar tú pedido!' }
    end
  end

  def update
    @order = draft_order
    service = OrderCreationService.new(order: @order, brand: @brand, user: current_user, params: params)

    respond_to do |format|
      generate_order_collection(params) if service.execute!

      format.json { head :no_content }
      format.html { redirect_to [current_user, @order], notice: 'Has actualizado tú pedido!' }
    end
  end

  def destroy
    @order.soft_delete!

    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Orden eliminada exitosamente' }
      format.json { head :no_content }
    end
  end

  private

  def find_order
    @order = Order.find_by!(id: params[:id])
  end

  def active_brands
    Brand.active.sort_created_at
  end

  def find_brand
    @brand = active_brands.find_by(id: params[:brand_id])
  end

  def find_user
    @user = User.find_by!(id: params[:user_id])
  end

  def draft_order
    current_user.orders.draft.first || current_user.orders.new
  end

  def unprocessable_entity
    respond_to do |format|
      format.html { redirect_to new_user_quote_path(current_user, brand: @brand), notice: @order.errors.full_messages.first }
      format.json { render json: @order.errors.full_messages, status: __method__ }
    end
  end

  def generate_order_collection(params)
    collection_service = OrderCollectionCreationService.new(
      order: @order,
      brand: @brand,
      user: current_user,
      params: params
    )

    collection_service.execute!
  end
end
