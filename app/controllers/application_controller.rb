class ApplicationController < ActionController::Base
  # 以下の文を書くことでviewでも使えるようになる
  helper_method :current_user
  # アクションの前に呼ばれるフィルタ
  # これで全てのアプリケーション内の全てのアクションの処理前に、ユーザーがログイン済みかどうかをチェックしログインしていなければログインページに飛ばすようになる
  before_action :login_required

  private
  # ログインしている人の情報をとってくるメソッド
  # ||=は@current_userがnilではなかったら@current_userに=の右のものを代入するという意味
  # つまり下記のコードの意味は
  # もしsession[:user_id]がnilではなかったら
  # sessionのuser_idでユーザーを探してきてcurrent_userにその情報を入れるという意味
  # よってcurrent_userメソッドの戻り値は@current_userとなる
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  
  def login_required
    redirect_to login_url unless current_user
  end
end
