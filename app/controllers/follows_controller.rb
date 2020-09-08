class FollowsController < ApplicationController

	def create
		following_id = params[:id]
		@user = User.find(following_id)
		current_user.followings.create('following_id': following_id)
	end

	def destroy
		following_id = params[:id]
		@user = User.find(following_id)
		current_user.followings.where('following_id': following_id).delete_all
	end

end