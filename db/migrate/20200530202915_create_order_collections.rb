# frozen_string_literal: true

class CreateOrderCollections < ActiveRecord::Migration[6.0]
  def up
    create_table :pets, id: :uuid do |t|
      t.string :name, null: false
      t.integer :age, null: false
      t.integer :status, default: 0, null: false
      t.string :kind_of_pet, null: false, default: 0
      t.string :gender, null: false, default: 0
      t.integer :weight, null: false, default: 0
      t.references :user, index: true, foreign_key: true, null: false, type: :uuid

      t.timestamps
    end

    create_table :order_collections do |t|
      t.references :order, index: true, foreign_key: true, null: false, type: :uuid
      t.references :brand, index: true, foreign_key: true, null: false, type: :uuid
      t.references :user, index: true, foreign_key: true, null: false, type: :uuid
      t.references :pet, type: :uuid

      t.timestamps
    end
  end
end
