class Answer < ApplicationRecord
	# model Association 
	belongs_to :question
	belongs_to :player
	# Validations
	validates_presence_of :answer
end
