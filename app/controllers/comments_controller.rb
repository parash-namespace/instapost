class CommentsController < ApplicationController


	before_action :get_post
	before_action :authenticate_user, only: [:create, :destroy]
	before_action :is_owner?, only: [:destroy]

	def index
		@comment = Comment.new
	end


	def create
		@comment = @post.comments.create(comment_params.merge(user_id: current_user.id))
		if @comment.valid?
			redirect_to post_comments_path(@post.id)
		else
			render :new
		end
	end


	def destroy
		@comment = Comment.find(params[:id])
		@comment.delete
		flash[:success] = "Comment removed."
		redirect_to post_comments_path(@post)
	end


	private

	def get_post
		@post = Post.find(params[:post_id])
	end

	def comment_params
		params.require(:comment).permit([:comment])
	end

	def is_owner?
		redirect_to root_path if current_user != Comment.find(params[:id]).user
	end

end