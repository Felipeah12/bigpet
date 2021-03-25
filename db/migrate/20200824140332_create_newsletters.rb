# frozen_string_literal: true

class CreateNewsletters < ActiveRecord::Migration[6.0]
  def change
    create_table :newsletters, id: :uuid do |t|
      t.string :title, null: false
      t.integer :status, default: 4
      t.text :content, null: false

      t.timestamps
    end
  end
end
