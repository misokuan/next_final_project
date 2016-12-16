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
	end

	def update
	end

	def destroy
	end

	private

	def comments_params
	    params.require(:comment).permit(:body, :image)
	end 
end
