class Odai < ApplicationRecord
	has_many :fukyos, :dependent => :destroy
	belongs_to :user
end
