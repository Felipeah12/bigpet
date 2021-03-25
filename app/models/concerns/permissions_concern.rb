# frozen_string_literal: true

module PermissionsConcern
  extend ActiveSupport::Concern
  EMAIL_REGEXP = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i.freeze

  included do
    enum role: %i[admin customer]

    enum status: %i[active draft soft_delete prospect newsletter published unpublished]

    enum kind_of_pet: {
      little_cat: I18n.t('kind_of_pet.little_cat'),
      little_dog: I18n.t('kind_of_pet.little_dog'),
      cat: I18n.t('kind_of_pet.cat'),
      dog: I18n.t('kind_of_pet.dog')
    }

    enum gender: { male: I18n.t('gender.male'), female: I18n.t('gender.female') }

    enum size_type: {
      thumb: I18n.t('size_type.thumb'),
      small: I18n.t('size_type.small'),
      medium: I18n.t('size_type.medium'),
      standard: I18n.t('size_type.standard'),
      big: I18n.t('size_type.big'),
      giant: I18n.t('size_type.giant')
    }

    scope :sort_id, -> { order(uid: :desc) }
    scope :sort_created_at, -> { order(created_at: :desc) }

    # use to set alias
    def set_alias
      email.split('@')[0].humanize
    end
  end
end
