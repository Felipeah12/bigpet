# frozen_string_literal: true

class OrderCollection < ApplicationRecord
  include PermissionsConcern

  belongs_to :order
  belongs_to :brand
  belongs_to :user
  belongs_to :pet, optional: true

  validates_uniqueness_of :order_id, scope: %i[user_id brand_id]
end
