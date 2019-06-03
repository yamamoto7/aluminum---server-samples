class Api::V1::PostsController < ApplicationController
  def index
    res = Faraday.get "http://localhost:3000/posts", {a: "hoge"}
    render json: { aaa: "aaaa" }
  end
end
