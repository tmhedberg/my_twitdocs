class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    @user = User.find_for_twitter_oauth env['omniauth.auth']

    flash[:success] = 'Signed in successfully'

    sign_in_and_redirect @user
  end
end
