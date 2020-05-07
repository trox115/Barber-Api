FactoryBot.define do
	factory :random_barber, class:Barber do
		name {Faker::Name.name  }
		short_description {Faker::Lorem.sentence(word_count: 1)}
		facebook {'https://facebook.com'}
		instagram {'https://instagram.com'}
		twitter {'https://twitter.com'}
		photo_link {Faker::Lorem.sentence(word_count: 1)}
		description {Faker::Lorem.sentence(word_count: 30)}
		color {Faker::Color.hex_color}
	end
end