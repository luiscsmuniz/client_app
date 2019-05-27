class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def gett
    session[:token] = request.env["omniauth.auth"][:credentials][:token]
    secret = Digest::SHA256.hexdigest 'provider_app'

    decoded_token = JWT.decode session[:token], secret, true, { algorithm: 'HS512' }
    session[:result] = decoded_token

    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      redirect_to new_user_registration_url
    end

  end

  def failure
    redirect_to root_path
  end
end
