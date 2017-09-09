class Notification < ApplicationRecord
	# model association
	belongs_to :player
	belongs_to :question
end
