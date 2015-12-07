class Comment < ActiveRecord::Base
	#after_save :create_notification
	has_many :notifications
  belongs_to :user
  belongs_to :micropost
  validates :user_id, presence: true
  validates :micropost_id, presence: true
  validates :content, presence: true

  # private

  # def create_notification
  # 	@micropost = Micropost.find_by(self.micropost_id)
  # 	@comment = Comment.find_by(self.id)
  # 	@user = User.find_by(@micropost.user_id) 
  # 	self.notifications.create(comment: self, micropost: self.micropost, user: @micropost.user)
  # end
end
