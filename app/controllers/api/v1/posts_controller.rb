class Api::V1::PostsController < ApplicationController
  before_action :get_user_from_token
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = @current_auth.posts.new(post_params)
    @post.save
    render_success
  end

  private
  def post_params
    params.permit(:body)
  end
end
