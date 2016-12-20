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
      	  	format.html { redirect_to new_user_campaign_reward_path(user_id:@campaign.user_id, campaign_id:@campaign.id), notice: 'Campaign was successfully created.' }
        	#format.html { redirect_to user_campaign_path(user_id:@campaign.user_id, id:@campaign.id), notice: 'Campaign was successfully created.' }
      	  else
        	format.html { render :new }
      	  end
    	end
    end

	def show 
		@campaign = User.find(params[:user_id]).campaign
		@posts = @campaign.posts

	end 

  def hashtags
    tag = Tag.find_by(name: params[:name])
    @campaign = tag.campaign
  end

	def edit 
		@user = User.find_by(id: params[:user_id])
    @campaign = Campaign.find(params[:campaign])
	end 

	def update 

		params.permit!

		@campaign = Campaign.find(params[:id])
		@campaign.update(campaign_params)

		redirect_to user_campaign_path
	end


	private 

	def campaign_params
	    params.require(:campaign).permit(:title, :description, :taggings, {campaign_images: []}, :cover_photo)
	end 
end
