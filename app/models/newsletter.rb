# frozen_string_literal: true

class Newsletter < ApplicationRecord
  include PermissionsConcern

  has_one_attached :image
  validates :title, :content, :image, presence: true
end
