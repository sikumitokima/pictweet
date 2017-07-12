  class TweetsController < ApplicationController

    before_action :move_to_index, except: :index
      #tweet/newに突然これないよう、強制的にindexを動かす
      #そのために①リダイレクト用のメソッドを定義する 
      #②new、createアクションを動かす前に①で定義したメソッドを動かす設定をする、という2つの工程が必要です。
       #リダイレクト用に準備したメソッド　:move_to_index を、すべての処理の前に処理するbeforeを使ってログインしてるか判定
       #indexアクションの場合は実行しない条件をつける

    def index
      @tweets = Tweet.includes(:user).page(params[:page]).per(5).order("created_at DESC")
    end

    def new
    end
    
    def create
      Tweet.create(image: tweet_params[:image], text: tweet_params[:text], user_id: current_user.id)   #user_id:current_user_idでユーザーのidを保存
      #current_userには現在ログイン中のユーザーのレコード一つがまるまるインスタンスとして代入されています。なので、current_user.usersテーブルのカラム名とすれば、usersテーブルのカラムの値を取得できます。繰り返しになりますが、今回保存するのはidカラムの値で良いので、current_user.idとしましょう。
    end

    def destroy
      tweet = Tweet.find(params[:id])
      if tweet.user_id == current_user.id
        tweet.destroy
      end
    end

    def edit
      @tweet = Tweet.find(params[:id])
    end

    def update
      tweet = Tweet.find(params[:id])
      if tweet.user_id == current_user.id
        tweet.update(tweet_params)
      end
    end

  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments.includes(:user)
  end
    private
    def tweet_params
      params.permit(:image, :text)
    end

  def move_to_index
     redirect_to action: :index unless user_signed_in?
      # user_signed_in? がfalseの場合、手前のaction :index を実行。(ログインしていなかった場合、「index」アクションを強制実行する)
  end

  end