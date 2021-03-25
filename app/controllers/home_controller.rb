# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @leed = Leed.new
  end

  def about; end
end
