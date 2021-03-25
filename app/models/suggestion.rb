# frozen_string_literal: true

class Suggestion < ApplicationRecord
  include PermissionsConcern

  validates :email, :phone, :question, presence: true
  validates :email, format: { with: EMAIL_REGEXP }
  validates :phone, format: { with: /\A(\d{7}|\d{10})\z/ }
  validates :question, length: {
    in: 15..140,
    too_short: I18n.t('activerecord.errors.too_short'),
    too_long: I18n.t('activerecord.errors.too_long')
  }
end
