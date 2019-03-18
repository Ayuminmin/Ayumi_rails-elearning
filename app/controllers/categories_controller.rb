class CategoriesController < ApplicationController

def index
  @categories = Category.all
  @lesson = Lesson.new
end

end
