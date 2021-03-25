# frozen_string_literal: true

class CreateBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :brands, id: :uuid do |t|
      t.string :name, null: false
      t.string :size_type, default: 0
      t.integer :min_width, null: false
      t.integer :max_width, null: false
      t.integer :gram_amount, null: false
      t.string :kind_of_pet, null: false, default: 0
      t.integer :status, default: 0, null: false
      t.float :price

      t.timestamps
    end
  end
end
