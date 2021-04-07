class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # devise利用の機能が使われる場合、その前にconfigure_permitted_parametersが実行される。

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name])
    # sign_upの際にnameのデータ操作が許可される。
  end
end
