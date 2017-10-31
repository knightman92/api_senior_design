class ChannelsController < ApplicationController
# Get your Account SID, Auth Token, Service SID and Channel SID
	# from twilio.com/console

	def index
		client = Twilio::REST::Client.new(ENV['account_sid'], ENV['auth_token'])
		# List the channels
		service = client.chat.v2.services(ENV['service_sid'])
		channels_response = "["
		service.channels.each do |c|
		  puts "#{c.sid} \"#{c.unique_name}\""  
			channels_response = channels_response+"\n{\n\"sid\": \"#{c.sid}\",\n\"unique_name\": \"#{c.unique_name}\"\n},"
		end
		channels_response = channels_response.chop+"\n]"
		json_response(channels_response)
	end

	def create
		@client = Twilio::REST::Client.new(ENV['account_sid'], ENV['auth_token'])
		# Create the channel
		service = @client.chat.v2.services(ENV['service_sid'])
		channel = service.channels.create(unique_name: params[:player_id])
		puts "Channel #{channel.sid} (\"#{channel.unique_name}\") created!"
	end 

	def show
		@client = Twilio::REST::Client.new(ENV['account_sid'], ENV['auth_token'])
		# Retrieve a particular channel
		my_channel_sid = params[:id]
		service = @client.chat.v2.services(ENV['service_sid'])
		channel = service.channels(my_channel_sid).fetch
		puts "Channel #{channel.sid} has Unique Name \"#{channel.unique_name}\""
		channel_response = "{\n\"sid\": \"#{channel.sid}\",\n\"unique_name\": \"#{channel.unique_name}\"\n}"
		json_response(channel_response)
	end

	def update
		# @client = Twilio::REST::Client.new(ENV['account_sid'], ENV['auth_token'])
		# service = @client.chat.v2.services(ENV['service_sid'])

		# # Update the channel
		# my_channel_sid = 'CH2949201e5ae14a1f9d6f49524fc76aba'
		# channel = service.channels(my_channel_sid).fetch
		# channel_updated = channel.update(unique_name: 'Test Channel')
		# puts "The \"#{channel.unique_name}\" channel " \
		#      "has become the \"#{channel_updated.unique_name}\" channel."
	end

	# def destroy
	# 	@client = Twilio::REST::Client.new(ENV['account_sid'], ENV['auth_token'])

	# 	# Delete a particular
	# 	channel_to_delete = 'CH21587b5cb1f84ddf9ba9817425048907'
	# 	service = @client.chat.v2.services(ENV['service_sid'])
	# 	response = service.channels(channel_to_delete).delete
	# 	puts response
	# end

end
