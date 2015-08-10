class CommentsController < ApplicationController
  before_action :set_riff

  def create
    @comment = @riff.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      respond_to do |format|
        format.html { redirect_to :back, notice: "Your comment has been saved." }
        format.js
      end
    else
      flash[:alert] = "Something went wrong, please try again."
      redirect_to root_url
    end
  end

  def destroy
    @comment = @riff.comments.find(params[:id])

    if @comment.user == current_user
      @comment.destroy
      respond_to do |format|
        format.html { redirect_to root_url, notice: "Comment deleted." }
        format.js
      end
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end

    def set_riff
      @riff = Riff.find(params[:riff_id])
    end
end
