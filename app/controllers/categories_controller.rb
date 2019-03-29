class CategoriesController < ApplicationController

  def index
    @lesson = Lesson.new
    @user_lesson = Lesson.where(user_id: current_user.id)
    @learned = @user_lesson.collect{ |n| n.category}
    @status = params[:status]
    if @status == "learned"
      @categories = Category.joins(:lessons).paginate(page: params[:page], per_page: 6)
    elsif @status == "unlearned"
      @categories =  Category.includes(:lessons).where(lessons: {category_id: nil}).paginate(page: params[:page], per_page: 6)
    else
      @categories = Category.all.paginate(page: params[:page], per_page: 6)
    end
  end

end
