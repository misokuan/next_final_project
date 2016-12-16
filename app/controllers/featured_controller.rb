class FeaturedController < ApplicationController
	def index
    if params[:tag_name] != nil 
      tag = Tag.find_by(name: params[:tag_name])
      byebug
      @campaign = tag.campaigns
    elsif params[:pg_name] != nil
      @campaign = []
      @pgsearch = PgSearch.multisearch(params[:pg_name])
      @pgsearch.each do |x|
        @campaign << Campaign.find(x.searchable_id)
      end
      byebug
      @campaign
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


 # <form class="navbar-form navbar-left">
 #        <div class="form-group">
 #          <input type="text" class="form-control" placeholder="Search">
 #        </div>
 #        <button type="submit" class="btn btn-default">Submit</button>
 #      </form>