class SessionsController < ApplicationController
  skip_before_action :require_login, only: %i[login test]

  def test
    # tw_client.post_to_twitter(content: 'テスト投稿です。無視してください。')
    # tw_client.search_user_by_email
    len   = ActiveSupport::MessageEncryptor.key_len
    salt  = SecureRandom.random_bytes(len)
    key   = ActiveSupport::KeyGenerator.new('password').generate_key(salt, len) # => "\x89\xE0\x156\xAC..."
    crypt = ActiveSupport::MessageEncryptor.new(key)
    password = '$2a$10$N4g2/Ra8vUREwBILRi8Vi.6q.LTqIs5fzad0YwUq59lb6ZGQYpmMG'
    pp crypt.decrypt_and_verify(password)
  end

  def login
    if params[:session] == {}
      ## フロントから送られてくるユーザーのセッション情報がなければ、@current_userをnilする
      set_current_user('')
      return puts "現在のログインユーザーは、いません。 login user: #{@current_user}"
    end

    set_current_user(params[:session][:user][:email])
    p "最終的なcurrent_userは、 #{@current_user}"
    # login userがすでにいる場合
    # return render json: { user: @current_user }, status: :ok if session[:user_id] && @current_user

    # ## ログイン方法がemailの場合
    # user = User.find_by(email: params[:email])
    # return unless user&.authenticate(params[:password])

    # session[:user_id] = user.id
    # render json: user, status: :ok
    # ## TODO: ログイン成功後にメールに通知を送信したい
  end

  def logout; end
end
