class CommentsController < ApplicationController
  def index
  end



  def create
    if current_user.comments.create(comment_params)
      redirect_to topics_path, notice: current_user.to_s + 'の投稿にコメントしました'
    else
      flash.now[:alert] = "コメントできませんでした"
      render :new
    end
  end

  def comment_params
    params.require(:comment).permit(:content,:topic_id)
  end
end
