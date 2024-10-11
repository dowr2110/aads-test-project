# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    @comment.parent_id = params[:parent_id] if params[:parent_id]

    if @comment.save
      redirect_to posts_path
    else
      redirect_to posts_path, alert: 'something wrong'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :parent_id)
  end
end