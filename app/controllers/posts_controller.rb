class PostsController < ApplicationController

	before_action :authenticate_user, only: [:new, :create, :edit, :update]
	before_action :assign_post, only: [:edit, :update, :destroy]

	def index
		@posts = Post.all
	end


	def new
		@post = Post.new
	end

	def create
		@post = current_user.posts.create(post_params)
		if @post.valid?
			redirect_to root_path
		else
			render :new, status: :unprocessale_entity
		end
	end

	def edit
	end


	def update
		@post.update(post_params)
		if @post.valid?
			redirect_to root_path
		else
			render :edit, status: :unprocessale_entity
		end
	end

	def destroy
		@post.destroy
		redirect_to root_path
	end


	private

	def post_params
		params.require(:post).permit([:photo, :description, :user_id])
	end

	def assign_post
		@post = Post.find(params[:id])
	end

end
