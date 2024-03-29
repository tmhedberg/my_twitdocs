class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    @user = User.find_for_twitter_oauth env['omniauth.auth']

    flash[:success] = 'Signed in successfully'

    sign_in @user
    redirect_to(session[:return_to] || @user)
  end

  def failure
    flash[:alert] = 'Authentication failed'
    redirect_to root_path
  end

  def after_sign_in_path_for(user)
    user_url user
  end
end
