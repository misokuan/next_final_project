class GoalsController < ApplicationController
	def edit 
		@user = User.find_by(id: params[:user_id])
    @campaign = Campaign.find_by(id: params[:campaign_id])
    @goal = Goal.find(params[:id])
	end

	def update 
		goal = Goal.find(params[:id])
		goal.update(goal_params)
		redirect_to user_campaign_path
	end

private
	def goal_params
	    params.require(:goal).permit(:title, :description, :goal_per_month)
	end 
end
