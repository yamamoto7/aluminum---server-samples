class Api::V1::AuthsController < ApplicationController
  before_action :get_user_from_token
  def update
    @current_auth.update(auth_params)
  end

  private
  def auth_params
    params.permit(
      :image
    )
  end
end
