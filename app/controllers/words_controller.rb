class WordsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @lessons = Lesson.where(user_id:  params[:user_id])
    # @categories = Category.where(id: @lessons.category_ids)
  end

end
