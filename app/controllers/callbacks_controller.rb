class CallbacksController < Devise::OmniauthCallbacksController
  def twitter
    @user = User.from_omniauth(request.env["omniauth.auth"])
    flash[:notice] = "You are now signed in"
    sign_in_and_redirect @user
  end
end
