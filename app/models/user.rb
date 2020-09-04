class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: {case_sensitive: false}

  # has_one_attached :photo

  before_save :downcase_email


  def downcase_email
	self.email = email.downcase
  end

end
