require  'rails_helper'

RSpec.describe Barber do
	subject { described_class.new(name:"teste", short_description:"Short description", facebook:"https://facebook.com", twitter:"https://twitter.com", instagram:"https://instagram.com", photo_link:"barber1", description:"this is the long description with minimum chars = 60 so I need to add more chars until I make at least 60 chars, but i dont know if the ones in models have already 60 chars", color:'#ffffff')}
	describe 'Validates' do
		it 'If no name barber is not Valid' do 
			subject.name =nil
			expect(subject).to_not be_valid
		end
		it 'If no short description barber is not Valid' do 
			subject.short_description =nil
			expect(subject).to_not be_valid
		end
		it 'if facebook,twitter or instagram is a link' do 
			subject.facebook ="hello"
			expect(subject).not_to be_valid
			subject.twitter ="hello"
			expect(subject).not_to be_valid
			subject.instagram ="hello"
			expect(subject).not_to be_valid
			subject.facebook ="https://facebook.com"
			subject.twitter ="https://twitter.com"
			subject.instagram ="https://instagram.com"
			expect(subject).to be_valid

		end
		it 'If color is hexadecimal' do
			subject.color = '12344'
			expect(subject).not_to be_valid
			subject.color="#ffffff"
			expect(subject).to be_valid
		end
		it 'If subject meets all requirments' do
			expect(subject).to be_valid
		end
		it 'if short_description has a maximum of 60 chars' do
			expect(subject).to be_valid
			subject.short_description = subject.description
			expect(subject).not_to be_valid
		end
		it 'if description has a minimum of 60 chars' do
			expect(subject).to be_valid
			subject.description = subject.short_description
			expect(subject).not_to be_valid
		end
	end
end