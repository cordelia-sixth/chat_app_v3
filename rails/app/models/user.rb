# 1人のユーザーを表す
# 複数のUserRoomを持つ

class User < ApplicationRecord
  has_many :user_rooms, dependent: :destroy
  has_many :rooms, through: :user_rooms
end
