class RoomChannel < ApplicationCable::Channel
  def subscribed
    # ルーム内のユーザーのみに送信する
    @user = User.find(params[:user_id])
    reject if @user.nil?

    @room = @user.rooms.find(params[:room_id])
    reject if @room.nil?

    stream_for(@room)
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
