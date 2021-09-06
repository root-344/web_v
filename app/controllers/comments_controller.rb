class CommentsController < ApplicationController
  before_action :side_index, {only: :create}

  def create
    comment = Comment.new(comment_params)
    if comment.save
      ActionCable.server.broadcast 'comment_channel', content: comment, user: comment.user, date: comment.created_at
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: @current_user.id, post_id: params[:post_id])
  end

end
