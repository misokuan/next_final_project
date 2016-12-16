class BeHeroController < ApplicationController
	def new 
		run_first 
		@client_token = Braintree::ClientToken.generate
	end

	def create 
		run_first									#check private
		run_braintree_sale				#check private
		run_payment_create				#check private
		flash[:alert] = "Your payment went through succesfully!"
		redirect_to home_path
	end


private 
	def run_first 
		@campaign = Campaign.find_by(id: params[:campaign_id])
		@user = User.find_by(id: params[:user_id])
		@campaign_user = @campaign.user
	end

	def run_braintree_sale
		nonce_from_the_client = params[:payment_method_nonce]
		@result = Braintree::Transaction.sale(
		  :amount => "10.00",
		  :payment_method_nonce => nonce_from_the_client,
		  :options => {
		  :submit_for_settlement => true
		  }
		)
	end

	def run_payment_create
		@payment = Payment.new 
		@payment.user_id = @user.id 
		@payment.campaign_id = @campaign.id 
		@payment.transaction_amount = @result.transaction.amount
		@payment.transaction_id = @result.transaction.id 
	end
end
