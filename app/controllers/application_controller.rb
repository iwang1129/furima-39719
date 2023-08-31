class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?
  # ifオプションがあるのは、値にメソッド名を指定することで、deviseのコントローラーのアクションに限定
  # そのときだけconfigure_permitted_parametersメソッドを実行するように設定   
  
  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  # 環境変数を読み込む記述に変更
    end
  end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_day])
  #  devise_parameter_sanitizer.permit(:deviseの処理名, keys: [:許可するキー])
  # 新規登録時、emailとencrypted_password以外もストロングパラメーターとして許可
    end
  
  # before_actionを使い各アクションの事前処理として設定
  # deviseの処理に関わるコントローラーはGemに記述されており、編集ができない。
  # そのため、編集ができるapplication_controller.rbにストロングパラメーターを定義しておき、
  # その処理を読み込ませる
  


  
end
