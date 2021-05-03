# チャットルームを表す
# 1人のユーザーに属する
# 1つのルームに属する

class UserRoom < ApplicationRecord
  belongs_to :user
  belongs_to :room
end
