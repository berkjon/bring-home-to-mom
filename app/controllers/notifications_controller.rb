class NotificationsController < ApplicationController
 
  skip_before_action :verify_authenticity_token
 
  def notify
  	client = Twilio::REST::Client.new ENV['twilio_account_sid'], ENV['twilio_auth_token']
  	message = client.messages.create(
  		:from => '+14242653879', 
  		:to => '+16263897771', 
  		:body => 'Test',
  		:media_url => 'http://linode.rabasa.com/yoda.gif'
  		# status_callback: request.base_url + '/twilio/status'
  		)

  	# render plain: message.status
  end
 
end