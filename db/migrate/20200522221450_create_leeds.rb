# frozen_string_literal: true

class CreateLeeds < ActiveRecord::Migration[6.0]
  def change
    create_table :leeds, id: :uuid do |t|
      t.string :name, null: false
      t.string :email, null: false, index: true
      t.integer :status, null: false, default: 0
      t.references :user, type: :uuid, index: true, foreign_key: true

      t.timestamps
    end
  end
end
