require 'rails_helper'

RSpec.describe Question, type: :model do
	#Association test
	it { should have_many(:answers).dependent(:destroy)}
	it { should belong_to(:player)}
	it { should belong_to(:coach)}
	#Validation tests
	it{should validate_presence_of(:question_text)}
	it{should validate_presence_of(:category)}
	it{should validate_presence_of(:age_range)}
	it{should validate_presence_of(:gender)}
	it{should validate_presence_of(:question_type)}
end
