class BindingsController < ApplicationController

	def index
		# Get your Account Sid and Auth Token from https://www.twilio.com/console
		client = Twilio::REST::Client.new(ENV['account_sid'], ENV['auth_token'])

		service = client.notify.v1.services(ENV['notify_service_sid'])

		# parameters from device
		start_date = Time.parse(params[:start_date])
		puts start_date

		bindings = service.bindings.list(tag: 'fcm', start_date: start_date)

		puts bindings
	end

	def create
		# Get your Account Sid and Auth Token from https://www.twilio.com/console
		client = Twilio::REST::Client.new(ENV['account_sid'], ENV['auth_token'])

		service = client.notify.v1.services(ENV['notify_service_sid'])

		# parameters from device
		identity = params[:name]
		fcm_token = params[:fcm_token]

		bind = service.bindings.create(
		  identity: identity,
		  binding_type: 'fcm',
		  address: fcm_token,
		)

		puts bind
	end

	def show
		# Get your Account Sid and Auth Token from https://www.twilio.com/console
		client = Twilio::REST::Client.new(ENV['account_sid'], ENV['auth_token'])

		service = client.notify.v1.services(ENV['notify_service_sid'])

		# parameters from device
		binding_id = params[:binding_id]

		bind = service.bindings(binding_id).fetch

		puts bind
	end

	def destroy
		# Get your Account Sid and Auth Token from https://www.twilio.com/console
		client = Twilio::REST::Client.new(ENV['account_sid'], ENV['auth_token'])

		service = client.notify.v1.services(ENV['notify_service_sid'])

		# parameters from device
		binding_id = params[:id]

		response = service.bindings(binding_id).delete

		puts response
	end
end
