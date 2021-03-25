# frozen_string_literal: true

class LeedCreationService < ApplicationService
  def initialize(leed, params)
    @leed = leed
    @params = params
  end

  def execute!
    leed.assign_attributes(params)
    leed.save!
  end

  private

  attr_reader :leed, :params
end
