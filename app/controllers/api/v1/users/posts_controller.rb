class Api::V1::Users::PostsController < ApplicationController
  before_action :user_token_auth
  def index
    render json: { aaa: "aaaa" }
  end
end
