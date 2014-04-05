FactoryGirl.define do
	factory :user do
		name "Adrian Sharma"
		email "sharma.rails@gmail.com"
		password "foobar"
		password_confirmation "foobar"
	end
end