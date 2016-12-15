class BeHeroController < ApplicationController
before_action :require_login

	def new 
		@campaign = Campaign.find_by(id: params[:campaign_id])
		@campaign_user = @campaign.user
		@user = current_user
		@client_token = Braintree::ClientToken.generate
	end

	def create 
		nonce_from_the_client = params[:payment_method_nonce]
		result = Braintree::Transaction.sale(
		  :amount => "10.00",
		  :payment_method_nonce => nonce_from_the_client,
		  :options => {
		  :submit_for_settlement => true
		  }
		)
		flash[:alert] = "Your payment went through succesfully!"
		redirect_to home_path
	end
end
