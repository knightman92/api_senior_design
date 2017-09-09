class Question < ApplicationRecord
	# model association
	has_many :answers, dependent: :destroy
	# belongs_to :player
	# belongs_to :coach
	# validations
	validates_presence_of :question_text
	validates_presence_of :category
	validates_presence_of :age_range
	validates_presence_of :gender
	validates_presence_of :question_type
end
