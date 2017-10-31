class MembersController < ApplicationController
# Get your Account SID, Auth Token, Service SID and Channel SID
	# from twilio.com/console

	def index
		channel_sid = params[:channel_sid]
		@client = Twilio::REST::Client.new(ENV['account_sid'], ENV['auth_token'])
		# list members
		service = @client.chat.v2.services(ENV['service_sid'])
		channel = service.channels(channel_sid)
		members_json = "[\n"
		channel.members.each do |member|
		    puts "#{member.sid} #{member.identity}"
		    members_json = members_json+"{\n"+"\"sid\": \"#{member.sid}\",\n"+"\"identity\": \"#{member.identity}\"\n"+"}," 
		end
		members_json = members_json.chop+"\n]"
		json_response(members_json)
	end

	def create
		channel_sid = params[:channel_sid]
		@client = Twilio::REST::Client.new(ENV['account_sid'], ENV['auth_token'])
		# Add the member
		service = @client.chat.v2.services(ENV['service_sid'])
		channel = service.channels(channel_sid)
		member = channel.members.create(identity: params[:email])
		puts member
	end 

	def show
		channel_sid = params[:channel_sid]
		@client = Twilio::REST::Client.new(ENV['account_sid'], ENV['auth_token'])
		# Retrieve the member
		service = @client.chat.v2.services(ENV['service_sid'])
		channel = service.channels(channel_sid)
		member = channel.members(params[:id]).fetch
		member_json = "{\n"+"\"identity\": \"#{member.identity}\"\n"+"}" 
		# member_json = member_json+"    \"identity\": \""+member.identity+"\",\n"
		# member_json = member_json+"    \"member_sid\": \""+member.sid+"\"\n"
		# member_json = member_json+"}"  
		puts member.identity
		json_response(member_json)
	end

	def update
		# @client = Twilio::REST::Client.new(ENV['account_sid'], ENV['auth_token'])
		# service = @client.chat.v2.services(ENV['service_sid'])

		# # Update the channel
		# my_channel_sid = 'CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
		# channel = service.channels(my_channel_sid).fetch
		# channel_updated = channel.update(unique_name: 'Something Different')
		# puts "The \"#{channel.unique_name}\" channel " \
		#      "has become the \"#{channel_updated.unique_name}\" channel."
	end

	def destroy
		# @client = Twilio::REST::Client.new(ENV['account_sid'], ENV['auth_token'])
		# # Remove the member
		# service = @client.chat.v2.services(service_sid)
		# channel = service.channels(channel_sid)

		# response = channel.members('MBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete
		# puts response
	end
end

