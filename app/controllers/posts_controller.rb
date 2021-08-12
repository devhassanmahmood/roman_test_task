# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :find_post, except: %i[index new create]

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def edit; end

  def show; end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description)
  end

  def find_post
    @post = Post.find_by(id: params[:id])
  end
end
