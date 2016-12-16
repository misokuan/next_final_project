class PostsController < ApplicationController

	def create

		params.permit!
		@post = Post.new(posts_params)
		@post.campaign_id = params[:campaign_id]

		respond_to do |format|
      	  if @post.save
        	format.html { redirect_to user_campaign_post_path(user_id:current_user.id, campaign_id:params[:campaign_id], id:@post.id), notice: 'Campaign was successfully created.' }
      	  else
        	format.html { render :new }
      	  end
    	end

		# @post.save
		# @post.update(params[:post])

		# redirect_to user_campaign_path(user_id: @posts.campaign.user.id, id: @posts.campaign.id)

	end

	def show 
		@post = Post.find(params[:id])
		
	end 

	def edit 
		
		@user = User.find(params[:user_id])
    	@campaign = Campaign.find(params[:campaign_id])
    	@post = Post.find(params[:id])

	end 

	def update 

		params.permit!

		@post = Post.find(params[:id])
		@post.update(posts_params)

		redirect_to user_campaign_path
	end

	def destroy 

		@post = Post.find(params[:id])
		
		@post.destroy
		redirect_to user_campaign_path
	end 

	private 

	def posts_params
	    params.require(:post).permit(:body, {post_images: []})
	end 
end

# Shows each Campaign Posts and any pictures attached to each post.

# <h2>Some of our New Posts about the Campaign: </h2>

# <% if @campaign.posts.length != 0 %>

#   <% posts = @campaign.posts %>
#   <% posts.each do |t| %>

#     <%= t.body %><br>

#     <% image_num = 0 %>
#       <% while image_num <= t.post_images.length - 1 %>      
#         <img src="<%= t.post_images[image_num].thumb.url %>">
#         <% image_num += 1 %>
#       <% end %>

#   <% end %>
# <% end %>