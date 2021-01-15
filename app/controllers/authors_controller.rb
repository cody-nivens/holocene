class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update, :destroy]
  before_action :set_book, only: [ :show, :index, :add, :list, :create, :new, :edit, :update, :destroy]


  # GET /books/:book_id/authors(.:format)
  def index
      @authors = @book.authors.order(:last_name)
  end

  # GET /books/:book_id/authors/:id(.:format)
  def show
  end

    # GET /authors/1/list
  def list
  end

  # GET /authors/1/add
  def add
    authors_avail = params[:authors_avail]
    authors_ids = params[:authors_ids]

    unless authors_avail.nil?
      authors_avail.each do |author_id|
        next if author_id.blank?
        author = Author.find(author_id)
        @book.authors << author unless @book.authors.include?(author)
      end
    end

    unless authors_ids.nil?
      authors_ids.each do |author_id|
        next if author_id.blank?
        author = Author.find(author_id)
        @book.authors.destroy(author) if @book.authors.include?(author)
      end
    end

    respond_to do |format|
       format.html { redirect_to book_authors_list_path(:book_id => @book.id) }
    end
  end


  # GET /books/:book_id/authors/new(.:format)
  def new
    @author = Author.new
    @author.user_id = current_user.id
    @author.books << @book
  end

  # GET /books/:book_id/authors/:id/edit(.:format) 
  def edit
  end

  # POST /books/:book_id/authors(.:format)
  def create
    @author = Author.new(author_params)

    respond_to do |format|
      if @author.save
        format.html { redirect_to book_author_path(@book,@author), notice: 'Author was successfully created.' }
        format.json { render :show, status: :created, location: @author }
      else
        format.html { render :new }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/:book_id/authors/:id(.:format)
  def update
    respond_to do |format|
      if @author.update(author_params)
        format.html { redirect_to book_author_path(@book,@author), notice: 'Author was successfully updated.' }
        format.json { render :show, status: :ok, location: @author }
      else
        format.html { render :edit }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/:book_id/authors/:id(.:format) 
  def destroy
    @author.destroy
    respond_to do |format|
      format.html { redirect_to book_authors_url(@book), notice: 'Author was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.find(params[:id])
    end

    def set_book
      @book = Book.find(params[:book_id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def author_params
      params.require(:author).permit(:first_name, :last_name, :user_id, :book_id)
    end
end
