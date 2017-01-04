class UserMailer < ApplicationMailer
  default from: ENV['MY_GMAIL_USERNAME']

  def reservation_email(customer, host, reservation_id)
    @customer = customer
    @host = host 
    @reservation_id = reservation_id 

    mail(to: host.email, subject: 'Congratulations!')
  end
end
