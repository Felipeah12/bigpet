# frozen_string_literal: true

class OrderCreationService < ApplicationService
  def initialize(order:, brand:, user:, params:)
    @order = order
    @brand = brand
    @user = user
    @params = params
  end

  def execute!
    order.assign_attributes(permitted_parameters)
    order.build_attributes(user: user, brand: brand)
    order.price = generate_price

    order.save!
  end

  private

  attr_reader :order, :brand, :user, :params

  def permitted_parameters
    params.require(:order).permit(:price, :comment, :delivery_date, :months, :address)
  end

  def generate_price
    (30 * order.months) * brand.gram_amount * brand.price
  end
end
