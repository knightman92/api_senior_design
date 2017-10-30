class ChannelsController < ApplicationController
# Get your Account SID, Auth Token, Service SID and Channel SID
	# from twilio.com/console

	def index
		account_sid = 'AC309ecc6b635e0352480eb78de524c4ce'
		auth_token = 'ba1aaeec93982846f48ed3534b2d0547'
		service_sid = 'IS8aab1320365f43fbb4bd92bfd20d5318'
		client = Twilio::REST::Client.new(account_sid, auth_token)
		# List the channels
		service = client.chat.v2.services(service_sid)
		service.channels.each do |c|
		  puts "#{c.sid} \"#{c.unique_name}\""
		end
	end

	# def createChannel(name)
	# 	account_sid = 'AC309ecc6b635e0352480eb78de524c4ce'
	# 	auth_token = 'ba1aaeec93982846f48ed3534b2d0547'
	# 	service_sid = 'IS8aab1320365f43fbb4bd92bfd20d5318'
	# 	@client = Twilio::REST::Client.new(account_sid, auth_token)
	# 	# Create the channel
	# 	service = @client.chat.v2.services(service_sid)
	# 	channel = service.channels.create(unique_name: name)
	# 	puts "Channel #{channel.sid} (\"#{channel.unique_name}\") created!"
	# end 

	def show
		account_sid = 'AC309ecc6b635e0352480eb78de524c4ce'
		auth_token = 'ba1aaeec93982846f48ed3534b2d0547'
		service_sid = 'IS8aab1320365f43fbb4bd92bfd20d5318'
		@client = Twilio::REST::Client.new(account_sid, auth_token)
		# Retrieve a particular channel
		my_channel_sid = 'CH2949201e5ae14a1f9d6f49524fc76aba'
		service = @client.chat.v2.services(service_sid)
		channel = service.channels(my_channel_sid).fetch
		puts "Channel #{channel.sid} has Unique Name \"#{channel.unique_name}\""
	end

	def update
		account_sid = 'AC309ecc6b635e0352480eb78de524c4ce'
		auth_token = 'ba1aaeec93982846f48ed3534b2d0547'
		service_sid = 'IS8aab1320365f43fbb4bd92bfd20d5318'
		@client = Twilio::REST::Client.new(account_sid, auth_token)
		service = @client.chat.v2.services(service_sid)

		# Update the channel
		my_channel_sid = 'CH2949201e5ae14a1f9d6f49524fc76aba'
		channel = service.channels(my_channel_sid).fetch
		channel_updated = channel.update(unique_name: 'Something Different')
		puts "The \"#{channel.unique_name}\" channel " \
		     "has become the \"#{channel_updated.unique_name}\" channel."
	end

	def destroy
		account_sid = 'AC309ecc6b635e0352480eb78de524c4ce'
		auth_token = 'ba1aaeec93982846f48ed3534b2d0547'
		service_sid = 'IS8aab1320365f43fbb4bd92bfd20d5318'
		@client = Twilio::REST::Client.new(account_sid, auth_token)

		# Delete a particular
		channel_to_delete = 'CH2949201e5ae14a1f9d6f49524fc76aba'
		service = @client.chat.v2.services(service_sid)
		response = service.channels(channel_to_delete).delete
		puts response
	end

end
