class Coach < ApplicationRecord
	# model association 
	has_many :players
	has_many :questions
	# validations
	validates_presence_of :first_name
	validates_presence_of :last_name
	validates_presence_of :email
	validates_uniqueness_of :email
	validates_presence_of :encrypted_password
	validates_presence_of :phone
end
