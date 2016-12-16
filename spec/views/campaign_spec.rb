require "rails_helper"

RSpec.describe "Campaign setup", :type => :request do
	before(:each) do
		@user = User.create(email: "abc@gmail.com", password: "1234Qwer")
		@campaign = Campaign.create(user_id: @user.id, taggings: '#abc #def')
	end

	it "shows the campaign " do
		get "/users/#{@user.id}/campaigns/new"
		expect(response).to render_template(:new)
	end

	it "shows the edit page (fix this is future)" do
		get "/users/#{@user.id}/campaigns/edit"
		current_user = @user
		expect(response).to render_template(:edit)
	end
	# it "shows the campaign " do

	# 	get "/users/#{@user.id}/campaigns/new"
	# 	expect(response).to render_template(:new)

	# 	post "/users/#{@user.id}/campaigns", :campaign => {:title => "My Campaign"}

	# 	expect(response).to redirect_to(assigns(:campaign))
	# 	follow_redirect!
	# 	expect(response).to render_template(:show)
	# 	expect(response.body).to include("My Campaign")
	# end

	it "does not render a different template" do
		get "/users/#{@user.id}/campaigns/new"
		expect(response).to_not render_template(:show)
	end


end