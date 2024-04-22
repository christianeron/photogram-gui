class CommentController < ApplicationController

  def create
    @comment = Comment.new
    @comment.body = params.fetch("query_comment")
    @comment.author_id = params.fetch("query_author")
    @comment.photo_id = params.fetch("query_photo")
    if @comment.valid?
      @comment.save
      redirect_to("/photos/#{params.fetch("query_photo")}")
    else
      redirect_to("/comments", { :notice => "comment failed to create successfully." })
    end
  end

end
