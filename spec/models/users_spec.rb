require 'spec_helper'

describe User do
  let(:user) { User.create twitter_username: 'Test User', oauth_uid: 123456 }

  subject { user }

  it { should respond_to(:twitter_username) }
  it { should respond_to(:documents) }
end
