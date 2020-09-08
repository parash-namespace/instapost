module FollowersHelper

	def is_followed_by_current_user?(user_id)
		current_user.followings.exists?('following_id': user_id)
	end

end