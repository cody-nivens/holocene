class BiblioentriesController < ApplicationController
  before_action :set_biblioentry, only: [:show, :edit, :update, :destroy]
  before_action :set_book, only: [:index, :new ]

  # GET /books/:book_id/biblioentries(.:format)
  def index
      @biblioentries = @book.biblioentries.order(:name)
  end

  # GET /books/:book_id/biblioentries/:id(.:format)
  def show
      @book = @biblioentry.book
  end

  # GET /books/:book_id/biblioentries/new(.:format)
  def new
    @biblioentry = Biblioentry.new
    @biblioentry.user_id = current_user.id
    @biblioentry.book_id = @book.id
  end

  # GET /books/:book_id/biblioentries/:id/edit(.:format)
  def edit
    @book = @biblioentry.book
  end

  # POST /books/:book_id/biblioentries(.:format)
  def create
    @biblioentry = Biblioentry.new(biblioentry_params)
    @book = @biblioentry.book

    respond_to do |format|
      if @biblioentry.save
        format.html { redirect_to biblioentry_url(@biblioentry), notice: 'Biblioentry was successfully created.' }
        format.json { render :show, status: :created, location: @biblioentry }
      else
        format.html { render :new }
        format.json { render json: @biblioentry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/:book_id/biblioentries/:id(.:format)
  def update
    @book = @biblioentry.book
    respond_to do |format|
      if @biblioentry.update(biblioentry_params)
        format.html { redirect_to biblioentry_url(@biblioentry), notice: 'Biblioentry was successfully updated.' }
        format.json { render :show, status: :ok, location: @biblioentry }
      else
        format.html { render :edit }
        format.json { render json: @biblioentry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/:book_id/biblioentries/:id(.:format)
  def destroy
    @book = @biblioentry.book
    @biblioentry.destroy
    respond_to do |format|
      format.html { redirect_to book_biblioentries_path(@book), notice: 'Biblioentry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_biblioentry
      @biblioentry = Biblioentry.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:book_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def biblioentry_params
      params.require(:biblioentry).permit(:name, :xreflabel, :copyright_year, :copyright_holder, :publisher, :user_id, :book_id, :author_ids => [])
    end
end
