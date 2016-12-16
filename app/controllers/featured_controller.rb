class FeaturedController < ApplicationController
	def index 
		@campaign = Campaign.all
	end 

	def show 
		@campaign = Campaign.find_by_id(params[:id])
		@user = @campaign.user
		@current_user = current_user.id
	end 
end
