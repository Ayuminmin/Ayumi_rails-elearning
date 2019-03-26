class FollowingsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @follow_users = @user.following.paginate(page: params[:page], per_page: 10)
  end
end
