require 'spec_helper'

describe 'Authentication' do
  let(:user) { User.create twitter_username: 'Test User', oauth_uid: 123456 }

  before do
    visit root_path

    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:twitter] =
      OmniAuth::AuthHash.new provider: 'twitter',
                             uid: user.oauth_uid,
                             info: { nickname: user.twitter_username }
  end

  subject { page }

  it do
    should(
      have_link('Sign in with Twitter',
                href: user_omniauth_authorize_path(:twitter))
    )
  end

  describe 'when clicking the sign-in link' do
    before { click_link 'Sign in with Twitter' }

    it do
      should have_selector('h1', text: "Welcome, #{user.twitter_username}!")
    end
  end
end
