class MailAuthController < ApplicationController
  skip_before_action :require_login

  def redirect_top_page
    ## ログインしたことにする

    ## トップページに遷移する
    redirect_to 'https://next-bosyu-frontend.vercel.app/'
  end
end
