class Api::V1::Users::RegistrationsController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user
    else
      render json: { error: @user.errors }, status: :accepted
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
