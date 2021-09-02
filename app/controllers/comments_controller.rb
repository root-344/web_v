class CommentsController < ApplicationController

  def create
    @user = User.all
    comment = Comment.new(comment_params)
    comment.save
    redirect_to("/posts/#{comment.post_id}")
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: @current_user.id, post_id: params[:post_id])
  end

end
