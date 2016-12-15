class RewardsController < ApplicationController

  def new
  	@campaign = Campaign.find(params[:campaign_id])
  	@user = User.find(params[:user_id])
  	@reward = []
    3.times do
      @reward << Reward.new
    end

  end

  def create
    num = 1
  	params["rewards"].each do |r|
  		if r["amount"] != "" || r["description"] != ""
  			new_reward = Reward.create(campaign_id: params[:campaign_id])
        case num
          when 1
            new_reward.update(rewards_class: "alpha")
          when 2
            new_reward.update(rewards_class: "beta")
          when 3
            new_reward.update(rewards_class: "gamma")
        end
        new_reward.update(reward_params(r))
        num += 1
  		end
  	end
  	redirect_to user_campaign_path(user_id: current_user.id, id: Reward.last.campaign.id)
  end

  	private

  	def reward_params(my_params)
  		my_params.permit(:amount, :description)
  	end

end
