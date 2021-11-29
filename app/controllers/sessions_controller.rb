class SessionsController < ApplicationController
  skip_before_action :require_login, only: %i[login test]

  def test
    tw_client.post_to_twitter(content: 'テスト投稿です。無視してください。')
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
