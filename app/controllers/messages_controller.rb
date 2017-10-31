class MessagesController < ApplicationController

	def index
		channel_sid = params[:channel_sid]
		client = Twilio::REST::Client.new(ENV['account_sid'], ENV['auth_token'])
		# list members
		service = client.chat.v2.services(ENV['service_sid'])
		channel = service.channels(channel_sid)
		messages_response = "[\n"
		channel.messages.each do |message|
		    puts "#{message.sid} #{message.body}"
		    messages_response = messages_response+"{\n\"sid\": \"#{message.sid}\",\n\"body\": \"#{message.body}\"\n},"
		end
		messages_response = messages_response.chop+"\n]"
		json_response(messages_response)
	end

	def create
		channel_sid = params[:channel_sid]
		@client = Twilio::REST::Client.new(ENV['account_sid'], ENV['auth_token'])
		# Add the member
		service = @client.chat.v2.services(ENV['service_sid'])
		channel = service.channels(channel_sid)
		message = channel.messages.create(body: params[:body])
		puts message
		response = "{\n\"message\": \"Message sent\"\n}"
		json_response(response)
	end 

	def show
		channel_sid = params[:channel_sid]
		@client = Twilio::REST::Client.new(ENV['account_sid'], ENV['auth_token'])
		# Retrieve the member
		service = @client.chat.v2.services(ENV['service_sid'])
		channel = service.channels(channel_sid)
		message = channel.messages(params[:id]).fetch
		message_json = "{\n\"message_sid\": \"#{message.sid}\",\n\"body\": \"#{message.body}\"\n}" 
		# member_json = member_json+"    \"identity\": \""+member.identity+"\",\n"
		# member_json = member_json+"    \"member_sid\": \""+member.sid+"\"\n"
		# member_json = member_json+"}"  
		puts "#{message.sid} #{message.body}"
		json_response(message_json)
	end

	def update
		# channel_sid = params[:channel_sid]
		# message_sid = params[:id]
		# @client = Twilio::REST::Client.new(ENV['account_sid'], ENV['auth_token'])

		# # Update the message
		# service = @client.chat.v2.services(ENV['service_sid'])
		# channel = service.channels(channel_sid).fetch
		# message = channel.messages(message_sid).fetch
		# message_updated = message.update(body: params[:body])
		# puts "#{message_updated.sid} #{message_updated.body}"
		# new_message = "Message was changed"
		# json_response(new_message)
	end

	def destroy
		channel_sid = params[:channel_sid]
		message_sid = params[:id]
		puts message_sid
		@client = Twilio::REST::Client.new(ENV['account_sid'], ENV['auth_token'])
		# Remove the member
		service = @client.chat.v2.services(ENV['service_sid'])
		channel = service.channels(channel_sid)
		response = channel.messages(message_sid).delete
		puts response
		messages_response= "{\n\"message\": \"Message was deleted\"\n}"
		json_response(messages_response)
	end
end
