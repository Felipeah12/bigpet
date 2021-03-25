class QuotesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_brand, only: %i[new]

  def index
    searcher = Searchers::Brands.new(params)
    @brands = searcher.by_query_params
  end

  def new
    @order = draft_order
    @order.build_attributes(user: current_user, brand: @brand)
  end

  private

  def active_brands
    Brand.active.sort_created_at
  end

  def find_brand
    @brand = active_brands.find_by(id: params[:brand])
  end

  def draft_order
    current_user.orders.draft.first || current_user.orders.new
  end
end
