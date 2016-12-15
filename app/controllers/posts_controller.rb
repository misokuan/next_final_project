class PostsController < ApplicationController

	def create

		params.permit!
		@posts = Post.new(campaign_id: params[:campaign_id])
		@posts.save
		@posts.update(params[:post])
		#byebug
		redirect_to user_campaign_path(user_id: @posts.campaign.user.id, id: @posts.campaign.id)

	end

    def hashtags
    tag = Tag.find_by(name: params[:name])
    @posts = tag.posts
  
  end

end
