class SessionsController < ApplicationController
  # 以下を書くことで全てのアクションがログインしていない場合はログインページにリダイレクトされるのをスキップすることができる。
  # ログイン画面を表示するアクションにもApplicationControllerの方で書いたbefore_actionが適応されてしまうのでこの記述が必要
  skip_before_action :login_required

  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    
    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: 'ログインしました。'
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_url, notice: "ログアウトしました。"
  end



  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
