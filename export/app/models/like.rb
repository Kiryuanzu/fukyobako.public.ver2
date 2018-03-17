class Like < ApplicationRecord
  belongs_to :fukyo, counter_cache: :likes_count
  belongs_to :user
end
