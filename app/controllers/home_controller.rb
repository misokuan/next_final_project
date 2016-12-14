class HomeController < ApplicationController
	def index
		if signed_in? && current_user.campaign != nil
			redirect_to user_campaign_path(current_user, current_user.campaign.id)
		elsif current_user.profile != nil
			redirect_to user_profile_path(current_user, current_user.profile.id) if signed_in?
		else
			redirect to home_path
		end
	end 
end
