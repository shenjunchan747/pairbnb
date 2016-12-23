class User < ApplicationRecord
  include Clearance::User

  validates :first_name, presence: true


end
