class CommentsController < ApplicationController

	def create
		params.permit!
		@posts = Post.find(params[:post_id])
		@comments = Comment.new(post_id: params[:post_id], user_id: current_user.id)
		@comments.save
		@comments.update(params[:comment])
		redirect_to user_campaign_path(user_id: @posts.campaign.user.id, id: @posts.campaign.id)
	end
end
