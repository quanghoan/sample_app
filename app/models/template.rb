class Template < ActiveRecord::Base
	belongs_to :user
	validates :user_id, presence: true
	has_many :steps, dependent: :destroy
	validates :subject, uniqueness: true,  presence: true, length: {maximum: 50}
	validates :body,  presence: true
end
