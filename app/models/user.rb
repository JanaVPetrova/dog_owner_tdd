class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :nickname, :provider, :url, :username, :admin

  def self.admin?
    :admin
  end

  def self.find_for_facebook_oauth access_token
    if user = User.where(:url => access_token.info.urls.Facebook).first
      user
    else 
      User.create!(:provider => access_token.provider,
                   :url => access_token.info.urls.Facebook,
                   :username => access_token.extra.raw_info.name,
                   :nickname => access_token.extra.raw_info.username,
                   :email => access_token.extra.raw_info.email,
                   :password => Devise.friendly_token[0,20],
                   :admin => false)
    end
  end

  def self.find_for_vkontakte_oauth access_token
    if user = User.where(:url => access_token.info.urls.Vkontakte).first
      user
    else 
      User.create!(:provider => access_token.provider,
                   :url => access_token.info.urls.Vkontakte,
                   :username => access_token.info.name,
                   :nickname => access_token.extra.raw_info.domain,
                   :email => access_token.extra.raw_info.domain+'@vk.com',
                   :password => Devise.friendly_token[0,20],
                   :admin => false)
    end
  end

  #
  #"https://api.twitter.com/oauth/access_token"
  def self.find_for_twitter_oauth access_token
    if user = User.where(:url => access_token.info.urls.Twitter).first
      user
    else
      User.create!(
          :provider => access_token.provider,
          :url => access_token.info.urls.Twitter,
          :username => access_token.info.name,
          :nickname => access_token.info.nickname,
          :email => access_token.info.nickname+'@twitter.com',
          :password => Devise.friendly_token[0,20],
          :admin => false
      )
    end
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end

  has_many :posts
end
