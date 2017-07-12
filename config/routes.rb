#     get 'tweets' => 'tweets#index'
    #URLの末尾がtweetsというパスの時、どんな処理をするか
    #今回の場合は、コントローラーtweets(_contoroller)のとき、#indexというアクションを行う。
    #controllersフォルダの中にある
    #tweetsフォルダの中の→indexファイルを見に行く

# Rails.application.routes.draw do
#   devise_for :users
#   root   'tweets#index'
#   get   'tweets'      =>  'tweets#index'     #ツイート一覧画面
#   get   'tweets/new'  =>  'tweets#new'       #ツイート投稿画面
#   post  'tweets'      =>  'tweets#create'    #ツイート投稿機能
#   delete  'tweets/:id'  => 'tweets#destroy'  #ツイート削除機能
#   patch   'tweets/:id'  => 'tweets#update'   #ツイートの更新
#   get   'tweets/:id/edit'  => 'tweets#edit'  #ツイート編集画面
#   get   'users/:id'   =>  'users#show'    #Mypageへのルーティング
#   get 'tweets/:id' => 'tweets#show'       #ツイート詳細画面
# end

Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'
  resources :tweets  do                  #tweets_controllerに対してのresourcesメソッド
    resources :comments, only: [:create]
  end
  resources :users, only: [:show]       #users_controllerに対してのresourcesメソッド
end
