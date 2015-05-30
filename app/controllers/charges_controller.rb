class ChargesController < ApplicationController

	def new
	end

	def create
		date = Playdate.find(params[:date_id])
		@amount = (date.total_cost_per_person * 100) # amount in cents

		customer = Stripe::Customer.create(
			email:  params[:stripeEmail],
			card:   params[:stripeToken]
      )

		charge = Stripe::Charge.create(
      customer:    customer.id,
      amount:      @amount,
      description: date.id,
      currency:    'usd'
      )

		if current_user == date.initiator.parent
			date.initiator_paid = true
      date.save!
    elsif current_user == date.recipient.parent
     date.recipient_paid = true
     date.save!
   end

   if date.status == 'paid'
     notify(date)
   end

   redirect_to "/users/#{current_user.id}?message=paid&date=#{date.id}"

 rescue Stripe::CardError, Stripe::InvalidRequestError => e
  flash[:error] = e.message
  redirect_to date_path(date)
end

def notify(date)
  client = Twilio::REST::Client.new ENV['twilio_account_sid'], ENV['twilio_auth_token']

  message_to_initiator = client.messages.create(
   :from => '+14242653879',
   :to => "#{date.initiator.phone.gsub('-','')}",
   :body => "Your parent has set you up on a date with #{date.recipient.first_name}",
   )

  message_to_recipient = client.messages.create(
   :from => '+14242653879',
   :to => "#{date.recipient.phone.gsub('-','')}",
   :body => "Your parent has set you up on a date with #{date.initiator.first_name}",
   )
end

end
