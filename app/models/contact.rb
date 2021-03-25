# frozen_string_literal: true

class Contact < ApplicationRecord
  include PermissionsConcern

  validates :name, :email, :subject, :message, presence: true
  validates :email, format: { with: EMAIL_REGEXP }
  validates :message, length: {
    in: 20..220,
    too_short: I18n.t('activerecord.errors.too_short'),
    too_long: I18n.t('activerecord.errors.too_long')
  }

  validates :name, length: {
    in: 7..30,
    too_short: I18n.t('activerecord.errors.too_short'),
    too_long: I18n.t('activerecord.errors.too_long')
  }
end
