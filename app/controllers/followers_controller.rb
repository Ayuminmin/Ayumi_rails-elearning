class FollowersController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @followed_users = @user.followers.paginate(page: params[:page], per_page: 8)
  end
end
