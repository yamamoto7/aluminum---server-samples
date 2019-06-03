class Api::V1::PostsController < ApplicationController
  before_action :get_user_from_token
  def index
    @posts = Post.all
  end
end
