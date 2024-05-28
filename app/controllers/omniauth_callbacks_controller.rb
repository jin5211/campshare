# old
# class OmniauthCallbacksController < ApplicationController
#   def line; basic_action end

#   private
#   def basic_action
#     @omniauth = request.env["omniauth.auth"]
#     if @omniauth.present?
#       @profile = User.find_or_initialize_by(provider: @omniauth["provider"], uid: @omniauth["uid"])
#       if @profile.email.blank?
#         email = @omniauth["info"]["email"] ? @omniauth["info"]["email"] : "#{@omniauth["uid"]}-#{@omniauth["provider"]}@example.com"
#         @profile = current_user || User.create!(provider: @omniauth["provider"], uid: @omniauth["uid"], email: email, name: @omniauth["info"]["name"], password: Devise.friendly_token[0, 20])
#       end
#       @profile.set_values(@omniauth)
#       sign_in(:user, @profile)
#     end
#     flash[:notice] = "ログインしました"
#     redirect_to root_path
#   end

#   def fake_email(uid, provider)
#     "#{auth.uid}-#{auth.provider}@example.com"
#   end
# end


# app/controllers/omniauth_callbacks_controller.rb

# app/controllers/omniauth_callbacks_controller.rb

# app/controllers/omniauth_callbacks_controller.rb

# app/controllers/omniauth_callbacks_controller.rb

# app/controllers/omniauth_callbacks_controller.rb

# app/controllers/omniauth_callbacks_controller.rb

class OmniauthCallbacksController < ApplicationController
  def line
    basic_action
  end

  private

  def basic_action
    params[:privacy_policy] = '1'
    @omniauth = request.env["omniauth.auth"]
    if @omniauth.present?
      @profile = User.find_or_initialize_by(provider: @omniauth["provider"], uid: @omniauth["uid"])
      if @profile.email.blank?
        email = @omniauth["info"]["email"] ? @omniauth["info"]["email"] : "#{@omniauth["uid"]}-#{@omniauth["provider"]}@example.com"
        @profile.assign_attributes(
          email: email,
          name: @omniauth["info"]["name"],
          password: Devise.friendly_token[0, 20],
          privacy_policy: params[:privacy_policy]  # Check privacy_policy parameter
        )

        if @profile.valid? && @profile.save
          sign_in(:user, @profile)
        else
          flash[:alert] = "プライバシーポリシーに同意してください"
          redirect_to new_user_registration_path
          return
        end
      else
        sign_in(:user, @profile)
      end
    end

    flash[:notice] = "ログインしました"
    redirect_to root_path
  end
end





