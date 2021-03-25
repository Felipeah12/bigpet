# frozen_string_literal: true

class NewsController < ApplicationController
  def index
    @news = Newsletter.published.sort_created_at.limit(10)
  end
end
