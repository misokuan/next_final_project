class BeHero < ActiveRecord::Base
	attr_accessor :current_step

	def current_step 
		@current_step || steps.first 
	end

	def steps 
		%w[rewardsform braintreeform]
	end
end