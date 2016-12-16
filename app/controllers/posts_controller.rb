class PostsController < ApplicationController

	def create

		params.permit!
		@post = Post.new(posts_params)
		@post.campaign_id = params[:campaign_id]
		byebug
		respond_to do |format|
      	  if @post.save
        	format.html { redirect_to user_campaign_post_path(user_id:current_user.id, campaign_id:params[campaign_id]), notice: 'Campaign was successfully created.' }
      	  else
        	format.html { render :new }
      	  end
    	end

		# @post.save
		# @post.update(params[:post])

		redirect_to user_campaign_path(user_id: @posts.campaign.user.id, id: @posts.campaign.id)

	end

	def show 
		@post = Post.find(params[:id])
	end 

	def edit 

		@user = User.find_by(id: params[:user_id])
    	@campaign = Campaign.find(params[:campaign])
    	@post = Post.find(params[:post])

	end 

	def update 

		params.permit!
		@post = Post.find(params[:id])
		@post.update(posts_params)

		redirect_to user_campaign_path
	end

	def destroy 

		@post.destroy
		redirect_to user_campaign_path
	end 

	private 

	def posts_params
	    params.require(:post).permit(:body, {post_images: []})
	end 
end
