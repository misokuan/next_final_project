class CampaignsController < ApplicationController
	def index 
	end 

	def new
      @controller = Controller.new
    end

    def create
    	@user = User.find_by(id: params[:user_id])
    	@campaign = Campaign.new
    end

	def show 
		@campaign = current_user.campaign
	end 

	def edit 
		@user = User.find_by(id: params[:user_id])
    @campaign = Campaign.find(params[:campaign])

	end 

	def destroy 
		sign_out
		redirect_to home_path
	end 

	def update 
		campaign = Campaign.find(params[:id])
		campaign.update(campaign_params)
		redirect_to user_campaign_path
	end


	private 

	def campaign_params
	    params.require(:campaign).permit(:title, :description, :rewards, :taggings)
	end 
end
