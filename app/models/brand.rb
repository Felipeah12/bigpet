# frozen_string_literal: true

class Brand < ApplicationRecord
  include PermissionsConcern

  has_many :order_collections
  has_many :orders, through: :order_collections
  has_one_attached :image

  validates :name, :image, :kind_of_pet, :size_type, :min_width, :max_width, :gram_amount, :price, presence: true
  validates_numericality_of :max_width, greater_than: :min_width

  scope :search_by, ->(param) { where('LOWER(name) LIKE ?', "%#{param.downcase}%") }
  scope :by_kind, ->(kind) { where(kind_of_pet: kind) }
  scope :by_size, ->(size) { where(size_type: size) }
  scope :by_weight, ->(weight) { where('min_width >= ? AND max_width <= ?', weight.to_i - 10, weight) }
end
