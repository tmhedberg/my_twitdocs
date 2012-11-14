class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    @user = User.find_for_twitter_oauth env['omniauth.auth']

    flash[:success] = 'Signed in successfully'

    sign_in_and_redirect @user
  end

  def after_sign_in_path_for(user)
    user_url user
  end
end
