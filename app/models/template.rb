class Template < ActiveRecord::Base
	belongs_to :user
	has_many :steps, dependent: :destroy
	validates :subject, uniqueness: true,  presence: true
	validates :body,  presence: true
end
