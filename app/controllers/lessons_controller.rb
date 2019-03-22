class LessonsController < ApplicationController

  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      @lesson.create_activity(user_id: current_user.id)
      redirect_to new_lesson_answer_url(@lesson)
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  private
  def lesson_params
    params.permit(:category_id).merge(user_id: current_user.id)
  end

end
