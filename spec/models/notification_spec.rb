require 'rails_helper'

RSpec.describe Notification, type: :model do
	#Association test
	it { should belong_to(:player)}
	it { should belong_to(:question)}
	#Validation tests
end
