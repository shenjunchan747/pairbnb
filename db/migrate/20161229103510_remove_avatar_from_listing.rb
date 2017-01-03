class RemoveAvatarFromListing < ActiveRecord::Migration[5.0]
  def change
    remove_column :listings, :avatar
  end
end
