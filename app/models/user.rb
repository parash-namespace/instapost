class User < ApplicationRecord

  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :username, presence: true, uniqueness: {case_sensitive: false}

  has_secure_password
  acts_as_voter
  
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_one_attached :photo

  before_save :downcase_email

  has_many :followers, class_name: "Follow", foreign_key: :following_id, dependent: :destroy
  has_many :followings, class_name: "Follow", foreign_key: :follower_id, dependent: :destroy

  has_many :follower_users, through: :followers, source: :follower
  has_many :following_users, through: :followings, source: :following


  def downcase_email
  	self.email = email.downcase
  end

end