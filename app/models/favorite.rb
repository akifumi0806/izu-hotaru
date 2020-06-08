class Favorite < ApplicationRecord
	belongs_to :place
	belongs_to :user
	validates_uniqueness_of :place_id, scope: :user_id#一人が一つの投稿に対して1つしかいいねつけられない
end
