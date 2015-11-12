class Step < ActiveRecord::Base
	has_many :users, through: :user_steps
	belongs_to :template
	validates :template_id, presence: true
	validates :hour, presence: true, numericality: {only_integer: true, greater_than: -1, less_than: 12 }
	validates :day, presence: true, numericality: { only_integer: true, greater_than: -1, less_than: 8 }
end
