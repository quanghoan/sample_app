class Template < ActiveRecord::Base
	belongs_to :user
	has_many :steps, dependent: :destroy
	validates :subject, uniqueness: true,  presence: true, length: { maximum: 15 }
	validates :body,  presence: true, length: { maximum: 100 }
end
