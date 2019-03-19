class CategoriesController < ApplicationController

def index
  @categories = Category.all
  @lesson = Lesson.new
  @user_lesson = Lesson.where(user_id: current_user.id)
  @learned = @user_lesson.collect{ |n| n.category}
end

end
