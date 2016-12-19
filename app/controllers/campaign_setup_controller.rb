class CampaignSetupController < ApplicationController

	def  new 
		@userid = current_user.id
		@campaign = Campaign.new
	end


	def create 
		@campaign = Campaign.new
		campaign_init
		byebug
		goal_init
		@campaign.update(goal_id: @goal.id)
		rewards_init
		redirect_to home_path
	end	


private 
	def campaign_init 
		@campaign.title = params[:campaign_title]
		@campaign.description = params[:campaign_description]
		@campaign.user_id = params[:user_id]
		@campaign.save
		@campaign.update(taggings: [params[:campaign_tag_music], params[:campaign_tag_art], params[:campaign_tag_novels], params[:campaign_tag_tutorials]].join(" "))
	end 

	def goal_init 
		@goal = Goal.new 
		@goal.title = params[:goal_title]
		@goal.description = params[:goal_description]
		@goal.goal_per_month = params[:goal_per_month]
		@goal.save
	end 

	def rewards_init
		@reward1 = Reward.new 
			@reward1.campaign_id = @campaign.id
			@reward1.amount = params[:reward_alpha]
			@reward1.description = params[:reward_description]
			@reward1.rewards_class = 'alpha'
		@reward1.save

		@reward2 = Reward.new 
			@reward2.campaign_id = @campaign.id
			@reward2.amount = params[:reward_beta]
			@reward2.description = params[:reward_description2]
			@reward2.rewards_class = 'beta'
		@reward2.save

		@reward3 = Reward.new 
			@reward3.campaign_id = @campaign.id
			@reward3.amount = params[:reward_gamma]
			@reward3.description = params[:reward_description3]
			@reward3.rewards_class = 'gamma'
		@reward3.save
	end 

end
