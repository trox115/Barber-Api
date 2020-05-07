require  'rails_helper'

RSpec.describe Booking do
	let(:user){create(:random_user)}
	let(:barber){create(:random_barber)}
	subject { described_class.new(user_id:user.id, barber_id: barber.id, book_time:"2020-05-19 09:00:32")}
	describe 'Validates' do
		it 'Booking created with right fields' do 
			expect(subject).to be_valid
		end
		it 'If booking have valid user_id' do
			subject.user_id = nil
			expect(subject).not_to be_valid
		end
		it 'If booking have valid barber_id' do
			subject.barber_id = nil
			expect(subject).not_to be_valid
		end
		it 'If booking have a Book Time' do
			subject.book_time = nil
			expect(subject).not_to be_valid
		end
		it 'If booking have an invalid Book Time' do
			subject.book_time = "test"
			expect(subject).not_to be_valid
		end

		it 'If booking have a valid Book Time' do
			subject.book_time = "2020-05-19 09:00:32"
			expect(subject).to be_valid
		end
		
	end
end