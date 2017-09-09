require 'rails_helper'

RSpec.describe Answer, type: :model do
	#Association test
	it { should belong_to(:question)}
	it { should belong_to(:player)}
	#Validation tests
	it{should validate_presence_of(:answer)}
end
