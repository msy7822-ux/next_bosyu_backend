class User < ApplicationRecord
  has_many :contracts
  has_many :watch_histories

  validates :first_name, presence: true
  validates :last_name, presence: true

  ## TODO: 今後ログイン方法増える可能性があるため、enumで管理する
  enum login_way: { email: 0, twitter: 1 }

  ## memo: passwordはnilだと保存失敗するがから文字列であればOK
end
