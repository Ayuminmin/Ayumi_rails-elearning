class WordsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @categories = Category.all
    if params[:title].present?
      @category = Category.find(params[:title])
      @answers = @category.answers
    else
      @answers = @user.answers
    end
  end

end
