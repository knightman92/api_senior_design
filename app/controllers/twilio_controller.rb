class TwilioController
	account_sid = "AC309ecc6b635e0352480eb78de524c4ce"
	auth_token = "ba1aaeec93982846f48ed3534b2d0547"   # Your Auth Token from www.twilio.com/console


	@client = Twilio::REST::Client.new account_sid, auth_token
	message = @client.messages.create(
	    body: "Just testing again",
	    to: "+14079242665",    # Replace with your phone number
	    from: "+13215783692")  # Replace with your Twilio number	
end
