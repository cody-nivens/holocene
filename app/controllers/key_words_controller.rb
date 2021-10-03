class KeyWordsController < ApplicationController
  before_action :set_key_word, only: %i[show edit update destroy]
  before_action :set_book, only: %i[index new create]

  # GET /key_words or /key_words.json
  def index
    @key_words = KeyWord.where(book_id: @book.id).order(:key_word)
  end

  # GET /key_words/1 or /key_words/1.json
  def show
    @book = @key_word.book
  end

  # GET /key_words/new
  def new
    @key_word = KeyWord.new
    @key_word.book = @book
  end

  # GET /key_words/1/edit
  def edit
    @book = @key_word.book
  end

  # POST /key_words or /key_words.json
  def create
    @key_word = KeyWord.new(key_word_params)

    respond_to do |format|
      if @key_word.save
        format.html { redirect_back_or_default(@key_word, notice: 'Key word was successfully created.') }
        format.json { render :show, status: :created, location: @key_word }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @key_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /key_words/1 or /key_words/1.json
  def update
    @book = @key_word.book
    respond_to do |format|
      if @key_word.update(key_word_params)
        format.html { redirect_back_or_default(@key_word, notice: 'Key word was successfully updated.') }
        format.json { render :show, status: :ok, location: @key_word }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @key_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /key_words/1 or /key_words/1.json
  def destroy
    @book = @key_word.book
    @key_word.destroy
    respond_to do |format|
      format.html { redirect_back_or_default(polymorphic_url([@book, :key_words]), notice: 'Key word was successfully destroyed.') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_key_word
    @key_word = KeyWord.find(params[:id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:book_id])
  end

  # Only allow a list of trusted parameters through.
  def key_word_params
    params.require(:key_word).permit(:key_word, :book_id)
  end
end
