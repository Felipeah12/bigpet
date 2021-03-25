# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, only: :show

  def index
    @orders = Order.active.sort_created_at
    @customers = User.active.customer
    @leeds = Leed.sort_created_at
    @recents = @customers.sort_created_at.limit(10)
  end

  def show
    @pets = @user.pets.sort_created_at
    @orders = @user.orders.sort_created_at
  end

  def destroy; end

  private

  def find_user
    @user = User.find_by!(id: current_user.id)
  end
end
