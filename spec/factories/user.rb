FactoryBot.define do
	factory :user do
		email {'Test@test.com'}
		pasword {'1234'}
	end

	factory :random_user, class:User do
		email {Faker::Internet.email }
		password {'1234'}
	end
end