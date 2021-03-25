# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders, id: :uuid do |t|
      t.integer :price, null: false
      t.string :comment
      t.integer :status, default: 0, null: false
      t.date :delivery_date, null: false
      t.string :address, null: false
      t.integer :months, default: 1, null: false

      t.timestamps
    end
  end
end
