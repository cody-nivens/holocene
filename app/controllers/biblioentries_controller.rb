class BiblioentriesController < ApplicationController
  before_action :set_biblioentry, only: %i[show edit update destroy]
  before_action :set_book, only: %i[index new]

  # GET /books/:book_id/biblioentries(.:format)
  def index
    @biblioentries = @book.biblioentries.includes([:authors]).order(:name)
    respond_to do |format|
      format.turbo_stream { render "shared/index", locals: { object: Biblioentry.new, objects: @biblioentrys } }
    end
  end

  # GET /books/:book_id/biblioentries/:id(.:format)
  def show
    @book = @biblioentry.book
    @biblioentries = @book.biblioentries.includes([:authors]).order(:name)
    respond_to do |format|
      format.turbo_stream { render "shared/show", locals: { object: @biblioentry } }
    end
  end

  # GET /books/:book_id/biblioentries/new(.:format)
  def new
    @biblioentry = Biblioentry.new
    @biblioentry.user_id = current_user.id
    @biblioentry.book_id = @book.id
  end

  # GET /books/:book_id/biblioentries/:id/edit(.:format)
  def edit
    @short = params[:short]
    @book = @biblioentry.book
  end

  # POST /books/:book_id/biblioentries(.:format)
  def create
    @biblioentry = Biblioentry.new(biblioentry_params)
    @book = @biblioentry.book

    respond_to do |format|
      if @biblioentry.save
        @biblioentries = @book.biblioentries.includes([:authors]).order(:name)
#        format.html { redirect_to biblioentry_url(@biblioentry), notice: 'Biblioentry was successfully created.' }
        format.json { render :show, status: :created, location: @biblioentry }
        flash.now[:notice] = "Biblioentry was successfully created."
        format.turbo_stream { render "shared/index", locals: { object: Biblioentry.new, objects: @biblioentrys } }
      else
        format.html { render :new }
        format.json { render json: @biblioentry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/:book_id/biblioentries/:id(.:format)
  def update
    @short = params[:short]
    @book = @biblioentry.book
    @biblioentries = @book.biblioentries.includes([:authors]).order(:name)
    respond_to do |format|
      if @biblioentry.update(biblioentry_params)
#        format.html { redirect_to biblioentry_url(@biblioentry), notice: 'Biblioentry was successfully updated.' }
        format.json { render :show, status: :ok, location: @biblioentry }
        flash.now[:notice] = "Biblioentry was successfully updated."
        format.turbo_stream { render "shared/update", locals: { object: @biblioentry, short: @short } }
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
    @biblioentries = @book.biblioentries.includes([:authors]).order(:name)
    respond_to do |format|
      format.html { redirect_to book_biblioentries_path(@book), notice: 'Biblioentry was successfully destroyed.' }
      format.json { head :no_content }
      flash.now[:notice] = "Biblioentry was successfully destroyed."
      format.turbo_stream { render "shared/index", locals: { object: Biblioentry.new, objects: @biblioentrys } }
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
    params.require(:biblioentry).permit(:name, :xreflabel, :copyright_year, :copyright_holder, :publisher, :user_id,
                                        :book_id, author_ids: [])
  end
end
