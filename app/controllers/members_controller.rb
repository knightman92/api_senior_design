class MembersController < ApplicationController
# Get your Account SID, Auth Token, Service SID and Channel SID
	# from twilio.com/console
	# account_sid = 'AC309ecc6b635e0352480eb78de524c4ce'
	# auth_token = 'ba1aaeec93982846f48ed3534b2d0547'
	# service_sid = 'IS8aab1320365f43fbb4bd92bfd20d5318'

	def index
		account_sid = 'AC309ecc6b635e0352480eb78de524c4ce'
		auth_token = 'ba1aaeec93982846f48ed3534b2d0547'
		service_sid = 'IS8aab1320365f43fbb4bd92bfd20d5318'
		channel_sid = 'CH2949201e5ae14a1f9d6f49524fc76aba'
		@client = Twilio::REST::Client.new(account_sid, auth_token)
		# list members
		service = @client.chat.v2.services(service_sid)
		channel = service.channels(channel_sid)
		channel.members.each do |member|
		    puts "#{member.sid} #{member.identity}"
		end
	end

	def create
		account_sid = 'AC309ecc6b635e0352480eb78de524c4ce'
		auth_token = 'ba1aaeec93982846f48ed3534b2d0547'
		service_sid = 'IS8aab1320365f43fbb4bd92bfd20d5318'
		channel_sid = 'CH2949201e5ae14a1f9d6f49524fc76aba'
		@client = Twilio::REST::Client.new(account_sid, auth_token)
		# Add the member
		service = @client.chat.v2.services(service_sid)
		channel = service.channels(channel_sid)
		member = channel.members.create(identity: 'New_user')
		puts member
	end 

	def show
		account_sid = 'AC309ecc6b635e0352480eb78de524c4ce'
		auth_token = 'ba1aaeec93982846f48ed3534b2d0547'
		service_sid = 'IS8aab1320365f43fbb4bd92bfd20d5318'
		channel_sid = 'CH2949201e5ae14a1f9d6f49524fc76aba'
		@client = Twilio::REST::Client.new(account_sid, auth_token)
		# Retrieve the member
		service = @client.chat.v2.services(service_sid)
		channel = service.channels(channel_sid)
		member = channel.members('MBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch
		puts member.identity
	end

	def update
		# @client = Twilio::REST::Client.new(account_sid, auth_token)
		# service = @client.chat.v2.services(service_sid)

		# # Update the channel
		# my_channel_sid = 'CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
		# channel = service.channels(my_channel_sid).fetch
		# channel_updated = channel.update(unique_name: 'Something Different')
		# puts "The \"#{channel.unique_name}\" channel " \
		#      "has become the \"#{channel_updated.unique_name}\" channel."
	end

	def destroy
		account_sid = 'AC309ecc6b635e0352480eb78de524c4ce'
		auth_token = 'ba1aaeec93982846f48ed3534b2d0547'
		service_sid = 'IS8aab1320365f43fbb4bd92bfd20d5318'
		channel_sid = 'CH2949201e5ae14a1f9d6f49524fc76aba'
		@client = Twilio::REST::Client.new(account_sid, auth_token)
		# Remove the member
		service = @client.chat.v2.services(service_sid)
		channel = service.channels(channel_sid)

		response = channel.members('MBXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete
		puts response
	end
end

