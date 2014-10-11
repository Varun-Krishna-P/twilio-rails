class SendTextController < ApplicationController
  before_filter :send_message, :only => [:create]
  def index
  end

  def new
    @twilio = TwilioTryout.new
  end
  def create
    render :text => params[:twilio].inspect
  end

  def send_message
   # number_to_send = params[:number_to_send]
   number_to_send = params[:twilio][:mobilenuber]
   message_to_send = params[:twilio][:message]
    twilio_sid = "your-twilio-sid"
    twilio_token ="your-twilio-auth-token"
    twilio_phone_number = "your-twilio-number"
  

    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => "+91#{number_to_send}",
      :body => "#{message_to_send} sent from +1#{twilio_phone_number}"
     )

    puts "hello world"
    puts "sent from #{twilio_phone_number} to the mobile number #{number_to_send}and the message is #{message_to_send}"

  end
end
