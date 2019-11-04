class CommentsController < ApplicationController
    def create
        @data = params
        
        @comment = Comment.new
        @comment.user = current_user.email
        @comment.memo = params[:comment][:memo]
        @comment.post_id = params[:post_id]
        @comment.save
        
        redirect_to request.referrer
    end
    
    def destroy
        Comment.find(params[:id]).destroy
        
        redirect_to request.referrer
    end
end
