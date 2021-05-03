class MessagesController < ApplicationController

  # 送信されたメッセージをDBに保存
  # メッセージフォームsubmit後に実行
  def create
    @message = Message.create!(message_params)
    @room = Room.find_by(id: message_params[:room_id])
    
    # ブロードキャストする
    RoomChannel.broadcast_to(@room, message: @message.template)
  end

  private
    # 送信されたメッセージを取得
    def message_params
      params.require(:message).permit(:content, :room_id, :user_id, :image)
    end
end
