class CampaignsController < ApplicationController
	def index 
	end 

	def show 
		@campaign = current_user.campaign
	end 

	def edit 
	end 

	def delete 
	end 
end
