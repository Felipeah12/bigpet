# frozen_string_literal: true

class OrderCollectionCreationService < ApplicationService
  def initialize(order:, brand:, user:, params:)
    @order = order
    @brand = brand
    @user = user
    @params = params
  end

  def execute!
    collection = order.order_collection
    collection.user = user
    collection.brand = brand
    collection.pet_id = params[:pet_id] || nil
    collection.save!
  end

  private

  attr_reader :order, :brand, :user, :params
end
