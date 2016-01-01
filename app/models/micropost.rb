class Micropost < ActiveRecord::Base
<<<<<<< HEAD
  has_many :likes
  has_many :users, through: :likes
=======
  acts_as_votable
  has_many :notifications
  has_many :likeables, dependent: :destroy
  has_many :liked_users, through: :likeables, source: :users
>>>>>>> 7ef753d747f4773988a872c1481ff23bf3647490
  has_many :comments, dependent: :destroy
  belongs_to :user
  default_scope -> {order(created_at: :desc)}
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 140}
  validate :picture_size
  acts_as_votable
  def like(micropost)
    likeables.created(user_id: current_user.id, micropost_id: micropost.id)
  end

  def unlike(micropost)
    likeables.find_by(user_id: current_user.id, micropost_id: micropost.id).destroy
  end

  private

  # Validates the size of an uploaded picture
  def picture_size
  	if picture.size > 5.megabytes
  		errors.add(:picture, "should be less than 5MB")
  	end
  end
end
