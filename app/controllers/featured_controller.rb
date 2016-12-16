class FeaturedController < ApplicationController
	def index
    if params[:tag_name] != nil 
      tag = Tag.find_by(name: params[:tag_name])
      byebug
      @campaign = tag.campaigns
    else
		  @campaign = Campaign.all
    end
	end 

	def show 
		@campaign = Campaign.find_by_id(params[:id])
		@user = @campaign.user
		@current_user = current_user.id
	end 
end
