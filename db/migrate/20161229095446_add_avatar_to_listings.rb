class AddAvatarToListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :avatar, :string
  end
end
