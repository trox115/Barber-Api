require 'rails_helper'

RSpec.describe Barber do
  let(:barber) { build(:random_barber) }
  describe 'Validates' do
    it 'If no name barber is not Valid' do
      barber.name = nil
      expect(barber).to_not be_valid
    end
    it 'If no short description barber is not Valid' do
      barber.short_description = nil
      expect(barber).to_not be_valid
    end
    it 'if facebook,twitter or instagram is a link' do
      barber.facebook = 'hello'
      expect(barber).not_to be_valid
      barber.twitter = 'hello'
      expect(barber).not_to be_valid
      barber.instagram = 'hello'
      expect(barber).not_to be_valid
      barber.facebook = 'https://facebook.com'
      barber.twitter = 'https://twitter.com'
      barber.instagram = 'https://instagram.com'
      expect(barber).to be_valid
    end
    it 'If color is hexadecimal' do
      barber.color = '12344'
      expect(barber).not_to be_valid
      barber.color = '#ffffff'
      expect(barber).to be_valid
    end
    it 'If barber meets all requirments' do
      expect(barber).to be_valid
    end
    it 'if short_description has a maximum of 60 chars' do
      expect(barber).to be_valid
      barber.short_description = barber.description
      expect(barber).not_to be_valid
    end
    it 'if description has a minimum of 60 chars' do
      expect(barber).to be_valid
      barber.description = barber.short_description
      expect(barber).not_to be_valid
    end
  end
end
