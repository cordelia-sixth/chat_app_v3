class RoomsController < ApplicationController
  # 現在のユーザを取得する
  brefore_action :set_user only: [:index, :show]


  # 現在のユーザが持つルーム一覧を取得
  def index
    @rooms = @user.room.all
  end

  # 現在のユーザが持つ特定のルームを
  def show
    @room = @user.rooms.find(params[:id])
  end

  private
    # 現在のユーザを取得
    def ser_user
      @user = User.find(params[:id])
    end
end
