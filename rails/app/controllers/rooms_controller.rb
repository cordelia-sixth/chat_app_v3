class RoomsController < ApplicationController
  # 現在のユーザを取得する
  before_action :set_user, only: [:index, :show]


  # 現在のユーザが持つルーム一覧を取得
  def index
    @rooms = @user.rooms.all
  end

  # 現在のユーザが持つ特定のルームを
  def show
    @room = @user.rooms.find(params[:id])
    @messages = @room.messages.all
  end

  private
    # 現在のユーザを取得
    def set_user
      @user = User.find(params[:user_id])
    end
end
