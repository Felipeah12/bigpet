# frozen_string_literal: true

module Searchers
  class Brands
    def initialize(params)
      @params = params
    end

    def by_query_params
      apply_filters
    end

    private

    attr_reader :params

    def apply_filters
      query = brands
      query = query.search_by(params[:search]) if params[:search].present?
      query = query.by_kind(params[:kind]) if params[:kind].present?
      query = query.by_size(params[:size]) if params[:size].present?
      query = query.by_weight(params[:weight]) if params[:weight].present?
      query
    end

    def brands
      @brands ||= Brand.active.sort_created_at
    end
  end
end
