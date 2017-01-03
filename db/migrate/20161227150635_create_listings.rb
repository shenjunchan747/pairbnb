class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :address
      t.belongs_to :user, index: true, foreign_key: true
      t.string :description
      t.integer :max_guests
      t.integer :price

      t.timestamps null:false
    end
  end
end
