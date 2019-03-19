class AnswersController < ApplicationController

  def new
    @lesson = Lesson.find(params[:lesson_id])
    @answer = Answer.new
    @category = Category.find(@lesson.category_id)
    @words = (@category.words - @lesson.words)
    if @words.size == 0
      redirect_to lesson_url(@lesson)
    end
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to new_lesson_answer_url(@answer.lesson_id)
    end
  end

  private
  def answer_params
    params.permit(:lesson_id, :word_id, :choice_id)
  end

end
