class Listing < ApplicationRecord 
  include Filterable
  include PgSearch 
  belongs_to :user
  has_many :reservations, dependent: :destroy
  mount_uploaders :photos, PhotoUploader
  multisearchable :against => [:title, :description]


  scope :price, -> (price) { where price: price}
  scope :max_guests, -> (max_guests) { where max_guests: max_guests }
  scope :starts_with, -> (title) { where("title like ?", "#{title}%")}
end