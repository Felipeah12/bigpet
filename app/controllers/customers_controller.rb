# frozen_string_literal: true

class CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_customer, only: :show

  def index
    @customers = User.customer.active.sort_created_at
  end

  def show
    @pets = @customer.pets
  end

  private

  def find_customer
    @customer = User.find_by!(params[:id])
  end
end
