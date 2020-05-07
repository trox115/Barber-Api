require  'rails_helper'

RSpec.describe User do
	let(:user) {create(:random_user)}
	let(:user2) {build(:random_user)}
	describe 'Validates' do
		it 'If no email user is not Valid' do 
			user.email =nil
			expect(user).to_not be_valid
		end
		it 'If no email or password user is not Valid' do 
			user.password =nil
			expect(user).to_not be_valid
		end
		it 'if email and password present user is valid' do 
			expect(user).to be_valid
		end
		it 'If email not valid, user is not valid' do
			user.email = 'apple'
			expect(user).not_to be_valid
		end
		it 'if password smaller that 4 chars user not valid' do
			user.password ="123"
			expect(user).not_to be_valid
		end
		it 'if emails are not the equal' do
			user2.email =user.email
			expect(user2).not_to be_valid
		end
	end
end