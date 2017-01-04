class Listing < ApplicationRecord 
  belongs_to :user
  has_many :reservations, dependent: :destroy

  mount_uploaders :photos, PhotoUploader
  
end
