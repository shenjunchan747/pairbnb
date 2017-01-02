class RenameColumnForListing < ActiveRecord::Migration[5.0]
  def change
    rename_column :listings, :avatars, :photos
  end
end
