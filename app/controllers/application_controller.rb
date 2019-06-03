class ApplicationController < ActionController::API
  # get token from request header
  def get_user_from_token
    token = request.headers['token']
    if token
      @current_auth = authenticate_user(token)
    else
      authenticate_error
      return
    end
  end

  def render_success(message = 'success')
      render json: {result: message}
  end
  private
  # check token
  def authenticate_user(token)
    auth = Auth.find_or_create_by(token: token)
    if auth
      return auth
    else
      authenticate_error
      return
    end
  end

  # error: invalid token
  def authenticate_error
    render json: { error: 'devise.failure.unauthenticated' }, status: :unauthorized
  end
end
