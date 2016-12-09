class UserMailer < ApplicationMailer

	def welcome_email(user)
		@user = user
		@url = 'http://localhost:3000'
		mail(to: @user.email, subject: "Welcome #{@user.email}!")
	end	
end
