class Fukyo < ApplicationRecord
	belongs_to :odai
	belongs_to :user
	has_many :comments, :dependent => :delete_all
	has_many :likes, dependent: :destroy
	def like_user(user_id)
	  likes.find_by(user_id: user_id)
	end
end