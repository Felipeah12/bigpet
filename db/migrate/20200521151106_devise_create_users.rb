# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'uuid-ossp'
    enable_extension 'pgcrypto'

    create_table :users, id: :uuid do |t|
      t.string :name, null: false
      t.string :phone, null: false
      t.integer :status, default: 0, null: false
      t.integer :role, default: 1, null: false
      t.string :address
      t.date :birthdate

      ## Database authenticatable
      t.string :email,              null: false, default: ''
      t.string :encrypted_password, null: false, default: ''

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at
      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :name,                 unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
