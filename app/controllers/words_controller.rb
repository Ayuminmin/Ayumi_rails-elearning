class WordsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @lessons = @user.lessons
    @categories = @lessons.collect{ |n| n.category }

    if params[:title].present?
      @category = Category.find(params[:title])
      @lesson = Lesson.find_by(user_id: @user.id, category_id: @category.id)
      @answers = @category.answers.where(lesson_id: @lesson.id )
    else
      @answers = @user.answers
    end
  end

end
