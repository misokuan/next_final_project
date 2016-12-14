class HomeController < ApplicationController
	def index 
		if signed_in? 
			@user = current_user.id
			@profile = current_user.profile
			redirect_to user_profile_path(@user, @profile.id)
		else 
			home_path
		end
	end 
end
