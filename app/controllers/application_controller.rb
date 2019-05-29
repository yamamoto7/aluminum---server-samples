class ApplicationController < ActionController::API
  def set_user_info
    if user_token_auth then
      response.headers['sign_info'] = 'user'
    else
      response.headers['sign_info'] = 'none'
    end
  end

  private
  # get token from request header
  def user_token_auth
    token = request.headers['token']
    if token
      @current_user = authenticate_user(token)
    else
      return false
    end
  end

  # check token
  def authenticate_user token
    unless token.include?(':u')
      authenticate_error
      return
    end

    user_id = token.split(':u').first
    user = User.find_by(id: user_id)
    if user && Devise.secure_compare(user.token, token)
      return user
    else
      authenticate_error
      return
    end
  end

  # error: invalid token
  def authenticate_error
    render json: { error: 'devise.failure.unauthenticated' }, status: 401
  end

end
