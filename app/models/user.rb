# frozen_string_literal: true

class User < ApplicationRecord
  include PermissionsConcern

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :order_collections
  has_many :orders, through: :order_collections
  has_many :pets
  has_many :leeds

  validates :name, :email, :phone, presence: true
  validates :password, presence: true, on: :create
  validates :email, format: { with: EMAIL_REGEXP }
  validates :name, length: {
    in: 7..30,
    too_short: I18n.t('activerecord.errors.too_short'),
    too_long: I18n.t('activerecord.errors.too_long')
  }

  validates :phone, length: {
    in: 7..10,
    too_short: I18n.t('activerecord.errors.too_short'),
    too_long: I18n.t('activerecord.errors.too_long')
  }
end
