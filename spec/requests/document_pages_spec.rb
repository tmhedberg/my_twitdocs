require 'spec_helper'

describe 'document pages' do
  let(:user) { User.create twitter_username: 'Test User', oauth_uid: 123456 }
  let(:doc) do
    Document.create name: 'test_document.txt', size: 20, user_id: user._id
  end

  before do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:twitter] =
      OmniAuth::AuthHash.new provider: 'twitter',
                             uid: user.oauth_uid,
                             info: { nickname: user.twitter_username }
  end

  subject { page }

  describe 'show' do
    before { visit document_path(doc) }

    it { should have_selector('h1', text: doc.name) }
    it { should have_content("Size: #{doc.size}") }
    it { should have_content("Type: #{doc.type}") }

    describe 'with unknown file type' do
      let(:doc_unknown) { Document.create name: 'test', size: 20 }

      before { visit document_path(doc_unknown) }

      it { should have_content('Type: Unknown') }
    end
  end

  describe 'new' do
    describe 'when not logged in' do
      before { get new_document_path }

      specify do
        response.should redirect_to(new_user_session_url)
      end
    end

    describe 'when logged in' do
      before do
        visit user_omniauth_authorize_path(:twitter)
        visit new_document_path
      end

      it { should have_selector('h1', text: 'Upload Document') }
    end
  end
end
