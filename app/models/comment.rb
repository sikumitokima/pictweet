class Comment < ActiveRecord::Base
  belongs_to :tweet               #コメントは、ツイートとユーザーの情報を１つしか持ち得ない。そのため、どちらも単数系。tweetsテーブルとのアソシエーション
  belongs_to :user                #usersテーブルとのアソシエーション
end
