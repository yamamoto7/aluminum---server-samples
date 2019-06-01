class Api::V1::Users::SessionsController < ApplicationController
  before_action :user_token_auth, only: [:destroy]
  # POST ログイン
  def create
    @user = User.find_for_database_authentication(email: params[:email])
    # emailから見つけられなかったらエラー
    return invalid_password_or_email unless @user

    if @user.valid_password?(params[:password]) then
      if @user.update_access_token! then
        sign_in :user, @user
        # ここヘッダーにトークン混ぜるよ
        response.headers['token'] = @user.access_token
        response.headers['sign_info'] = 'user'
        render json: @user
      else
        invalid_password_or_email
      end

    else
      invalid_password_or_email
    end
    # rendered at view/app/api/v1/users/sessions/create.json.jbuilder
  end


  def destroy
      authenticate_user_from_token!
      @current_user.access_token = 'broken_token'
      if @current_user.update(token_breaker)
        render :json => {success: true}
      else
        render :json => {success: false}
      end
  end


  private

  def token_breaker
    params.permit(:token)
  end
  def invalid_password_or_email
    warden.custom_failure!
    render json: { error: 'メールアドレスか、パスワードが間違っています。' }, status: :bad_request
  end
end
