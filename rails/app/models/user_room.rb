# チャットルーム1つを表す
# ユーザー1人に属する

class UserRoom < ApplicationRecord
  belongs_to :user
end
