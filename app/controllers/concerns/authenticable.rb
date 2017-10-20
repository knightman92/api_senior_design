module Authenticable

	def current_player
		@current_player ||= Player.find_by(auth_token: :auth_token)
	end

	def current_coach
		@current_coach ||= Coach.find_by(auth_token: :auth_token)
	end

	def authenticate_coach_with_token!
			render json: { error: "player Not authenticated" }, status: :unauthorized unless coach_signed_in?
		# else @current_coach
		# 	render json: { error: "coach Not authenticated" }, status: :unauthorized unless coach_signed_in?
	end
	def authenticate_player_with_token!
			render json: { error: "player Not authenticated" }, status: :unauthorized unless player_signed_in?
		# else @current_coach
		# 	render json: { error: "coach Not authenticated" }, status: :unauthorized unless coach_signed_in?
	end



	def player_signed_in?
		current_player.present?
	end

	def coach_signed_in?
		current_coach.present?
	end

end