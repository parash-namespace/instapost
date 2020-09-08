class PostsController < ApplicationController

	before_action :authenticate_user, only: [:new, :create, :edit, :update]
	before_action :assign_post, only: [:edit, :update, :destroy]
	before_action :is_owner?, only: [:edit, :update, :destroy]

	def index
		@posts = Post.paginate(page: params[:page], per_page: 4).order('created_at desc').includes(:user, comments: :user)
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
		params.require(:post).permit([:photo, :description])
	end

	def assign_post
		@post = Post.find(params[:id])
	end

	def is_owner?
		redirect_to root_path if Post.find(params[:id]).user != current_user
	end

end
