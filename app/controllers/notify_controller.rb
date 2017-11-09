class NotifyController < ApplicationController

	def create

		client = Twilio::REST::Client.new(ENV['account_sid'], ENV['auth_token'])

		service = client.notify.v1.services(ENV['notify_service_sid'])

		identity = params[:identity]

		notification = service.notifications.create(
		  identity: identity,
		  body: 'Hello World! Test test'
		)

		puts notification.sid
		# json_response(notification: notification)
	end
end
