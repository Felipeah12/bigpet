class CreateSuggestions < ActiveRecord::Migration[6.0]
  def change
    create_table :suggestions, id: :uuid do |t|
      t.string :email, index: true, null: false
      t.string :phone, null: false
      t.string :question, null: false
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
