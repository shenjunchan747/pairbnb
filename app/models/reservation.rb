class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :listing  
  validate :check_overlapping_dates
  validate :check_max_guests
  #validate num_guests cannot be negative
  #validate start date should be after today 

  def check_overlapping_dates
    #compare this new reservation against existing reservations
    listing.reservations.each do |old_booking|
      if overlap?(self, old_booking)
       return errors.add(:overlapping_dates, "The booking dates are not available")
      end
    end

  end 

  def overlap?(start,last )
    (start.start_date - last.end_date) * (last.start_date - start.end_date) > 0
  end 


  def check_max_guests
    max_guests = listing.max_guests
    return if num_guests <= max_guests
    errors.add(:max_guests, "Max guests number exceeded")
  end

  def cal_total_price
    price = listing.price 
    num_dates = (start_date..end_date).to_a.length
    return price * num_dates
  end 

end

