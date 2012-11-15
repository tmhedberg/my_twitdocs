require 'spec_helper'

describe 'document pages' do
  let(:user) { User.create twitter_username: 'Test User', oauth_uid: 123456 }
  let(:doc) do
    Document.create name: 'test_document.txt', size: 20, user_id: user._id
  end

  subject { page }

  describe 'show' do
    before { visit document_path(doc) }

    it { should have_selector('h1', text: doc.name) }
    it { should have_content("Size: #{doc.size}") }
    it { should have_content("Type: #{doc.type}") }
  end
end
