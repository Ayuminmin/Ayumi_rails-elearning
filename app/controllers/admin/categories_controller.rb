class Admin::CategoriesController < AdminController
  def index
    @categories = Category.all.order(created_at: :desc)
  end
  def new
    @category = Category.new
  end
  def create
  @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Successfully Add Category"
      redirect_to admin_categories_url
    else
      render 'new'
    end
  end
  def edit
    @category = Category.find(params[:id])
  end
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:success] = "Successifully edit Category"
      redirect_to admin_categories_url
    else
      render 'edit'
    end
  end
  def destroy
    category = Category.find(params[:id])
    category.destroy
    flash[:warning] = "Deleted categories: #{category.title}"
    redirect_to admin_categories_url
  end

  private
    def category_params
      params.require(:category).permit(:title, :description)
    end
end