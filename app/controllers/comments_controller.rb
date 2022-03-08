class CommentsController < ApplicationController
  def create
    @comment=Comment.new(comment_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype_id)  
    else
      render prototype_path(@comment.prototype_id)

    end
  end
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id,prototype_id: params[:prototype_id])
  end
end
