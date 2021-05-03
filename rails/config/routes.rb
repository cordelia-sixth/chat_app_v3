Rails.application.routes.draw do
  get 'messaeg/create'
  resources :users, only: [] do
    resources :rooms, only: [:index, :show]
  end

  # メッセージ送信
  resources :messages, only: [:create]
end
