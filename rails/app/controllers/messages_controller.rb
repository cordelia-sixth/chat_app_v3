class MessagesController < ApplicationController

  # 送信されたメッセージをDBに保存
  # メッセージフォームsubmit後に実行
  def create
    @message = Message.create!(message_params)
  end

  private
    # 送信されたメッセージを取得
    def message_params
      params.require(:message).permit(:content, :room_id, :user_id)
    end
end
