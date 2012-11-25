require 'factory_girl'
	
	FactoryGirl.define do
		factory :customer do
			firstName "Aliya"
			lastName "Hashim"
			phone "97444667532"
			email "aliya@aliya.com"
			address "PO Box 12345"
		end
		
		factory :customer_cupcake do
			name "Aliya"
			size "Mini" 
			flavor "Vanilla"
			icing "Vanilla"
			additional_topping "Chocolate"
			customer_id  1
		end
	end
