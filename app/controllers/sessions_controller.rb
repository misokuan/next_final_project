class SessionsController < Clearance::SessionsController

      def create_from_omniauth
        auth_hash = request.env["omniauth.auth"]

        authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) || Authentication.create_with_omniauth(auth_hash)
        if authentication.user
          user = authentication.user 
          authentication.update_token(auth_hash)
          if user.profile.nil?
            Profile.create(user_id: user.id) 
          else 
            Profile.where(user_id: user.id)
          end
          @next = user_profile_path(user, user.profile.id)
          @notice = "Signed in!"
        else
          user = User.create_with_auth_and_hash(authentication,auth_hash)
          Profile.create(user_id: user.id)
          @next = edit_user_profile_path(user_id: user.id, id: user.profile.id)   
          @notice = "User created - confirm or edit details..."
        end
        if user.username == nil
          user.username = user.email[/[^@]+/]
          user.save
        end
        sign_in(user)
        redirect_to @next, :notice => @notice
      end
    end