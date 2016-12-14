class BeHeroController < ApplicationController
	def show 
		@user = User.find_by(id: params[:user_id])
		@campaign = Campaign.find_by(id: params[:campaign_id])
	end
end
