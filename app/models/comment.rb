class Comment < ActiveRecord::Base

	has_many :notifications, dependent: :destroy
  belongs_to :user
  belongs_to :micropost
  validates :user_id, presence: true
  validates :micropost_id, presence: true
  validates :content, presence: true
end
