class Fukyo < ApplicationRecord
	validates :detail, length: { maximum: 150 }
	validates :title, presence: true, length: { maximum: 140 }
	validates :URL, length: { maximum: 255 }
	belongs_to :odai
	belongs_to :user
	has_many :comments, :dependent => :delete_all
	has_many :likes, dependent: :destroy
	def like_user(user_id)
	  likes.find_by(user_id: user_id)
	end
end