class Tweet < ActiveRecord::Base
  belongs_to :user
  has_many :comments               #ツイートは複数のコメントを持てるものなので、複数系commentsテーブルとのアソシエーション
end