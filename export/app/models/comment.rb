class Comment < ApplicationRecord
	validates :text, length: { maximum: 140 }
	belongs_to :fukyo
	belongs_to :user
end
