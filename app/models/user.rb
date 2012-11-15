class User
  include Mongoid::Document

  devise :omniauthable

  attr_accessible :oauth_provider, :oauth_uid, :twitter_username

  field :oauth_provider, type: String
  field :oauth_uid, type: String

  field :twitter_username, type: String

  has_many :documents

  def self.find_for_twitter_oauth(omniauth)
    user =
      User.where(oauth_provider: omniauth['provider'], oauth_uid: omniauth['uid'])
          .first

    unless user
      user =
        User.create! oauth_provider: omniauth['provider'],
                     oauth_uid: omniauth['uid'],
                     twitter_username: omniauth['info']['nickname']
    end

    user
  end
end
