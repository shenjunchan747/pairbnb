class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :listing, index: true, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.integer :num_guests


      t.timestamps null: false 
    end
  end
end
