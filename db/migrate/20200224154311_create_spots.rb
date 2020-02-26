class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.boolean :availability, default: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
