class TopicsController < ApplicationController
  def new
    @topic = Topic.new
  end


  # def comment_new
  #   @comment = Comment.new
  # end
  #
  # def all_comments
  #   @comments = Comment.all
  # end
  #
  # def createcomment
  #   if current_user.topics.create(comment_params)
  #     redirect_to topics_path, notice: 'コメントに成功しました'
  #   else
  #     flash.now[:alert] = "コメントに失敗しました"
  #   end
  # end

  def create
    if current_user.topics.create(topic_params)
      redirect_to topics_path, notice: '投稿に成功しました'
    else
      flash.now[:alert] = "投稿に失敗しました"
      render :new
    end
  end

  def index
    @topics = Topic.all
    @comment = Comment.new
    @comments = Comment.all
  end


  private
  def topic_params
    params.require(:topic).permit(:image, :description)
  end
  # def comment_params
  #   params.require(:comment).permit(:comment)
  # end
end
