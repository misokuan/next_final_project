class HomeController < ApplicationController
	def index
		if signed_in? 
			redirect_to user_campaign_path(current_user, current_user.campaign.id) if current_user.campaign != nil
			redirect_to user_profile_path(current_user, current_user.profile.id) if current_user.profile != nil
		end
	end 
end
