class Notification < ActiveRecord::Base
	belongs_to :user
	belongs_to :comment
	belongs_to :micropost
	validates :user_id, presence: true
	validates :comment_id, presence: true
	validates :micropost_id, presence: true
	default_scope -> {order(created_at: :desc)}
end
