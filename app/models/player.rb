class Player < ApplicationRecord
	# model association
	belongs_to :coach
	has_many :answers
	has_many :questions
	has_many :notifications
	# validations
	validates_presence_of :first_name
	validates_presence_of :last_name
	validates_presence_of :email
	validates_uniqueness_of :email
	validates_presence_of :encrypted_password
	validates_presence_of :phone
	validates_presence_of :gender
	validates_presence_of :points
	
end
