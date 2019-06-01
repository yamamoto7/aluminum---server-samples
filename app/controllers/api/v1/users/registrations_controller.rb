class Api::V1::Users::RegistrationsController < ApplicationController
  def create
    @user = User.new(user_params)
    if !@user.save
      render json: { error: @user.errors }, status: :bad_request
    end
    # rendered at view/app/api/v1/users/registrations/create.json.jbuilder
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
