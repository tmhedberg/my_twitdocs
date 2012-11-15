require 'spec_helper'

describe 'user pages' do
  before do
    @user = User.create! twitter_username: 'Test User', oauth_uid: 123456
    1.upto 10 do
      |n| @user.documents.create! name: "Test Document ##{n}.doc", size: n
    end
  end

  subject { page }

  describe 'show' do
    before { visit user_path(@user) }

    it do
      should have_selector('h1', text: "Welcome, #{@user.twitter_username}!")
    end

    describe 'document list' do
      it 'should have a link to each document' do
        @user.documents.each { |doc| should have_link(doc.name) }
      end
      it 'should display the metadata for each document' do
        @user.documents.each do |doc|
          should(
            have_content("(Size: #{doc.size}, type: #{doc.type}, uploaded ")
          )
        end
      end
    end
  end
end
