class User < ApplicationRecord
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :username, presence: true, uniqueness: {case_sensitive: false}

  has_secure_password
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_one_attached :photo

  before_save :downcase_email

  acts_as_voter

  def downcase_email
  	self.email = email.downcase
  end

end
