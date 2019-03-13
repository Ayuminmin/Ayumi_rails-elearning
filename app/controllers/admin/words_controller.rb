class Admin::WordsController < AdminController

  def index
    @category = Category.find(params[:category_id])
    @words = @category.words
  end

  def new
    category = Category.find(params[:category_id])
    @word = category.words.build
    3.times do
      @word.choices.build
    end
  end

  def create
    category = Category.find(params[:category_id])
    @word = category.words.build(word_params)
    if @word.save
      flash[:success] = "Success."
      redirect_to admin_category_words_url
    else
      flash[:danger] = "Invalid."
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:category_id])
    @word = Word.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @word = Word.find(params[:id])
    if @word.update_attributes(word_params)
      flash[:success] = "Success."
      redirect_to admin_category_words_url
    else
      render 'edit'
    end
  end

  def destroy
    word = Word.find(params[:id])
    word.destroy
    flash[:warning] = "Deleted word: #{word.content}"
    redirect_to @words
  end

  private
    def word_params
      params.require(:word).permit(:id, :content, :category_id,
        choices_attributes: [:id, :content])
    end
end