class UsersController < ApplicationController
  before_action :require_login, except: [:new,:create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Successfully sign up"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 10).search(params[:search])
  end

  def show
    @user = User.find(params[:id])
    @lessons = Lesson.where(user_id: @user.id)
    @activities = @user.activities.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Successfully Update!"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def dashboard
    @user = User.find(current_user.id)
    @lessons = Lesson.where(user_id: @user.id)
    @follow_users  = @user.following
    @activities = current_user.feed.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end

  private
  
  def user_params
    params.require(:user).permit(:name,:email, :password, :password_confirmation)
  end

  def require_login
    unless logged_in?
      flash[:danger] = "Unauthorizes Access! Please login..."
      redirect_to login_url
    end
  end

end
