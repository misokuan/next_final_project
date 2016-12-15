class CampaignsController < ApplicationController
	def index 
	end 

	def new
      @campaign = Campaign.new
      @userid = params[:user_id] # current_user.id
    end

    def create
    	@campaign = Campaign.new(campaign_params)
    	@campaign.user_id = params[:user_id] # current_user.id
    	respond_to do |format|
      	  if @campaign.save
        	format.html { redirect_to user_campaign_path(user_id:@campaign.user_id, id:@campaign.id), notice: 'Campaign was successfully created.' }
      	  else
        	format.html { render :new }
      	  end
    	end
    end

	def show 
		@campaign = User.find(params[:user_id]).campaign
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
