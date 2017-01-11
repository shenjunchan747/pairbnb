class PendingEmailJob < ApplicationJob
  queue_as :default

  def perform(customer, host, reservation_id)
    # Do something late

    UserMailer.reservation_email(customer, host,reservation_id).deliver_now
  end
end


   