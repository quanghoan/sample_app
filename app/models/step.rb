class Step < ActiveRecord::Base
	has_many :user_steps
	has_many :users, through: :user_steps
	belongs_to :template
	validates :template_id, presence: true
	validates :hour, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 13 }
	validates :day, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 8 }
end
  
  