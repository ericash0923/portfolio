class CommentsController < ApplicationController
 
 def create
  @comment = current_user.comment.build(comment_params)
 end
 
 private 
 
 def comment_parmas
  parmas.private(:comment).permint(:content)
 end
end
