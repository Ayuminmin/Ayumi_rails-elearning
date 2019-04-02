class CategoriesController < ApplicationController

  def index
    @lesson = Lesson.new
    @user_lesson = Lesson.where(user_id: current_user.id)
    @learneds = @user_lesson.collect{ |n| n.category}
    @choices = @user_lesson.collect{ |n| n.choices}
    @answers = @learneds.collect{ |n| n.answers }
    @status = params[:status] 
    if @status == "learned"
      @categories = @learneds
    elsif @status == "unlearned"
      @categories =  Category.all - @learneds
    else
      @categories = Category.all
    end
  end

end
