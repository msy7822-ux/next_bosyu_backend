class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true

  ## TODO: 今後ログイン方法増える可能性があるため、enumで管理する
  enum login_way: { email: 0, twitter: 1 }
end
