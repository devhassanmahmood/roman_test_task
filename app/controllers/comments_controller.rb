# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :find_post
  before_action :set_comment, only: %i[show edit update destroy]

  def index
    @comments = @post.comments
  end

  def new
    @comment = @post.comments.new
  end

  def show; end

  def edit; end

  def create
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to post_comments_path(@post) 
    else
      render :new 
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to post_comment_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to post_comments_path(@post)
  end

  private

  def find_post
    @post = Post.find_by(id: params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
