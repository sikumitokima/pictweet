class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname#現在ログインしているユーザーのレコードのインスタンスが代入される部分
    @tweets = user.tweets.page(params[:page]).per(5).order("created_at DESC")
    #(カラム名[:そのカラムの値])で条件に当てはまるレコードを取得。
  end
end