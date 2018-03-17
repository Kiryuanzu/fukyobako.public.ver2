class Odai < ApplicationRecord
	has_many :fukyos, :dependent => :destroy
	belongs_to :user
	validates :user_id, presence: true
	validates :detail, presence: true, length: { maximum: 140 }
end
