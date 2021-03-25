# frozen_string_literal: true

class Leed < ApplicationRecord
  include PermissionsConcern

  belongs_to :user, optional: true

  validates :name, :email, presence: true
  validates :email, format: { with: EMAIL_REGEXP }

  validates :name, length: {
    in: 7..30,
    too_short: I18n.t('activerecord.errors.too_short'),
    too_long: I18n.t('activerecord.errors.too_long')
  }
end
