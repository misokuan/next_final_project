class TokensController < ApplicationController
  before_filter :require_login 

  def get_token
    Twilio::Util::AccessToken.new(
      ENV['ACCOUNT_SID'],
      ENV['API_KEY_SID'],
      ENV['API_KEY_SECRET'],
      3600, 
      current_user.email
    )
  end

  def create
  token = get_token
  grant = get_grant
  token.add_grant(grant)
  render json: {username: current_user.email, token: token.to_jwt}
  end

  def get_grant 
  grant = Twilio::Util::AccessToken::IpMessagingGrant.new 
  grant.endpoint_id = "Chatty:#{current_user.email.gsub(" ", "_")}:browser"
  grant.service_sid = ENV['IPM_SERVICE_SID']
  grant
  end
end
