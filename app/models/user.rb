class User < ApplicationRecord
  ## ※DBに一レコードでも、password_digestが空のデータがあればうまく動作しない。
  has_secure_password

  has_many :contracts
  has_many :watch_histories

  validates :first_name, presence: true
  validates :last_name, presence: true

  ## TODO: 今後ログイン方法増える可能性があるため、enumで管理する
  enum login_way: { email: 0, twitter: 1 }

  def full_name
    "#{last_name} #{first_name}"
  end

  ## memo: passwordはnilだと保存失敗するがから文字列であればOK
end
