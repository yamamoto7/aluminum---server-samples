class Api::V1::Users::FollowsController < ApplicationController
  before_action :user_token_auth
  def index
    @users = current_user.follows
  end

  def create
  end

  def destroy
  end
end
