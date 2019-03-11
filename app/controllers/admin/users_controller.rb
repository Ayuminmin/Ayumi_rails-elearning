class Admin::UsersController < AdminController
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end 

  def update
    user = User.find(params[:id])
    if user.admin?
      user.update(admin:false)
      redirect_to admin_users_url
    else 
      user.update(admin:true)
      redirect_to admin_users_url
    end
  end
  
end