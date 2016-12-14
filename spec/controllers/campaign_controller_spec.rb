require 'rails_helper'

RSpec.describe CampaignsController, type: :controller do

	before(:each) do
		@user = User.create!(email: "abc@email.com", encrypted_password: "1234Qwer")
		@campaign = Campaign.create(user_id: @user.id, title: "My Campaign Title", description: "Abcdef")
		sign_in_as @user
	end

	describe "GET #show" do

		it "assigns the requested campaign to @campaigns" do
			get :show, user_id: @user.id, id: @campaign
			expect(assigns(:campaign)).to have_attributes(:id => (a_value == @campaign.id))
		end

		it "renders the #show view" do
			get :show, user_id: @user.id, id: @campaign
			expect(response).to render_template :show
		end
	end

	describe "POST #create" do

		context "with valid attributes" do
			it "creates a new listing" do
				expect{
					campaign_params = {title: "Abc", description: "Def"}
					post :create, user_id: @user.id, :campaign => campaign_params }.to change(Campaign,:count).by(1)
			end

			it "redirects to the new campaign" do
				campaign_params = {title: "Abc", description: "Def"}
				post :create, user_id: @user.id, campaign: campaign_params
	 				expect(response).to redirect_to user_campaign_path(@user, Campaign.last)
			end
		end
	end

	# describe "PUT #update" do

	# 	# context "valid attributes" do
	# 	# 	it "located the requested @campaign" do
	# 	# 		campaign_params = {user_id: @user.id, title: "My Campaign Title", description: "Abcdef"}	
	# 	# 		put :update, user_id: @user.id, id: @campaign, campaign: campaign_params
	# 	# 		expect(assigns(:campaigns)).to eq(@campaign)
	# 	# 	end
	# 	# end
	# end

	# 			it "changes @listing's attributes" do
	# 				put :update, id: @listing, listing: FactoryGirl.attributes_for(:listing, name: "DEF", city: "Damansara") 
	# 				@listing.reload
	# 				expect(@listing.name).to eq("DEF")
	# 				expect(@listing.city).to eq("Damansara")
	# 			end

	# 			it "redirects to the updated contact" do
	# 				put :update, id: @listing, listing: FactoryGirl.attributes_for(:listing)
	# 				expect(response).to redirect_to @listing
	# 			end

	# 		context "invalid attributes" do
	# 			it "locates the requested @listing" do
	# 				put :update, id: @listing, listing: FactoryGirl.attributes_for(:invalid_listing)
	# 				expect(assigns(:listings)).to eq(@listing)
	# 			end

	# 			it "does not change @listing's attributes" do
	# 				put :update, id: @listing, listing: FactoryGirl.attributes_for(:listing, name: "DEF", city: nil) 
	# 				@listing.reload
	# 				expect(@listing.name).not_to eq("DEF")
	# 				expect(@listing.city).to eq("Subang")
	# 			end

	# 			it "re-renders the edit method" do
	# 				put :update, id: @listing, listing: FactoryGirl.attributes_for(:invalid_listing)
	# 				expect(response).to redirect_to(:action => 'edit')
	# 			end
	# 		end

	# 	end

	# 	describe "DELETE #destroy" do
	# 		before :each do
	# 			@listing = FactoryGirl.create(:listing)
	# 		end

	# 		it "deletes the contact" do
	# 			expect{
	# 				delete :destroy, id: @listing
	# 				}.to change(Listing, :count).by(-1)
	# 			end

	# 			it "redirects to listings#index" do
	# 				delete :destroy, id: @listing
	# 				expect(response).to redirect_to listings_url
	# 			end
	# 		end


end
