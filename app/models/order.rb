# frozen_string_literal: true

class Order < ApplicationRecord
  include PermissionsConcern

  has_one :order_collection

  validates :price, :comment, :delivery_date, :address, :months, presence: true
  validates :comment, length: {
    in: 10..220,
    too_short: I18n.t('activerecord.errors.too_short'),
    too_long: I18n.t('activerecord.errors.too_long')
  }

  def build_attributes(user:, brand:)
    self.status = :draft
    self.delivery_date = default_date
    self.price = 30 * brand.gram_amount * brand.price
    self.address = user.address || address
  end

  private

  def default_date
    Time.zone.now + 4.days
  end
end
