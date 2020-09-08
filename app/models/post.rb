class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy

  
  has_one_attached :photo


  validates :photo, :description, :user_id, presence: true

  acts_as_votable

  delegate :username, :photo, to: :user, prefix: true
end
