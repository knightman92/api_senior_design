class TokensController < ApplicationController
	before_filter :authenticate_coach!
	name = 'kyle'

	def get_token
    Twilio::Util::AccessToken.new(
      ENV['TWILIO_ACCOUNT_SID'],
      ENV['TWILIO_API_KEY'],
      ENV['TWILIO_API_SECRET'],
      3600, 
      name
    )
  end

	def get_grant 
	  grant = Twilio::Util::AccessToken::IpMessagingGrant.new 
	  grant.endpoint_id = "Chatty:#{name.gsub(" ", "_")}:browser"
	  grant.service_sid = ENV['TWILIO_CHAT_SERVICE_SID']
	  grant
	end

	def create
	  token = get_token
	  grant = get_grant
	  token.add_grant(grant)
	  render json: {username: name, token: token.to_jwt}
		puts token
	end
	
end
