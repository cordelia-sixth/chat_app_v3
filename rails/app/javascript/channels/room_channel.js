import consumer from "./consumer"

// DOMの読み込み完了を待つために turbolinks:load を記述
document.addEventListener("turbolinks:load", () => {

  // room_idとuser_idはview側から渡す
  const data = document.getElementById("data")
  // チャットルーム以外のページから読み込まれないようにする
  if (data === null ) {
    return
  }
  const channel = "RoomChannel"
  const room_id = data.getAttribute("data-room-id")
  const user_id = data.getAttribute("data-user-id")

  // チャットルームのページを開くたびに同じチャットルームに対するサブスクリプションが
  // 複数作成されてしまう恐れを防ぐ
  if (!isSubscribed(channel, room_id, user_id)) {
    consumer.subscriptions.create(
      { channel: "RoomChannel", room_id: room_id, user_id: user_id },
      {
        connected() {
          // Called when the subscription is ready for use on the server
        },
  
        disconnected() {
          // Called when the subscription has been terminated by the server
        },
  
        // ブロードキャストされたデータを受け取る
        received(data) {
          const container = document.getElementById("container")
          container.insertAdjacentHTML('beforeend', data['message'])
        }
      }
    )  
  }
})

// helper
const isSubscribed = (channel, room_id, user_id) => {
  const identifier = `{"channel":"${channel}","room_id":"${room_id}","user_id":"${user_id}"}`
  const subscription = consumer.subscriptions.findAll(identifier)
  return !!subscription.length
}