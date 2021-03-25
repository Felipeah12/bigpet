# frozen_string_literal: true

class Pet < ApplicationRecord
  include PermissionsConcern

  belongs_to :user
  has_many :order_collections
  has_many :orders, through: :order_collections

  validates :name, :age, :kind_of_pet, :weight, :gender, presence: true
  validates :name, length: {
    in: 3..20,
    too_short: I18n.t('activerecord.errors.too_short'),
    too_long: I18n.t('activerecord.errors.too_long')
  }
end
