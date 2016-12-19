class CommentsController < ApplicationController

	def create
		params.permit!

		@post = Post.find(params[:post_id])
		@comment = Comment.new(comments_params)  
		@comment.post_id = params[:post_id] 
		@comment.user_id = current_user.id

		@comment.save
		# @comment.update(params[:comment])
		redirect_to user_campaign_path(user_id: @post.campaign.user.id, id: @post.campaign.id)
	end

	def edit

		@user = User.find(params[:user_id])
    	@campaign = Campaign.find(params[:campaign_id])
    	@post = Post.find(params[:post_id])
    	@comment = Comment.find(params[:id])

	end

	def update

		params.permit!

		@comment = Comment.find(params[:id])
		@comment.update(comments_params)

		redirect_to user_campaign_post_path(user: @comment.user_id, campaign: params[:campaign_id], id: @comment.post_id)

	end

	def destroy

		@comment = Comment.find(params[:id])

		@comment.destroy
		redirect_to user_campaign_path(user: params[:user_id], campaign: params[:campaign_id])

	end

	private

	def comments_params
	    params.require(:comment).permit(:body, :image)
	end 
end
