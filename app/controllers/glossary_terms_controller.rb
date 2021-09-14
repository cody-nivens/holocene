class GlossaryTermsController < ApplicationController
  before_action :set_glossary_term, only: [:show, :edit, :update, :destroy]
  before_action :set_book, only: [:index, :new ]


  # GET /glossary_terms
  # GET /glossary_terms.json
  def index
      @glossary_terms = @book.glossary_terms.order(:name)
  end

  # GET /glossary_terms/1
  # GET /glossary_terms/1.json
  def show
      @book = @glossary_term.book
  end

  # GET /glossary_terms/new
  def new
    @glossary_term = GlossaryTerm.new
    @glossary_term.book = @book
    @glossary_term.user = current_user
  end

  # GET /glossary_terms/1/edit
  def edit
    @book = @glossary_term.book
  end

  # POST /glossary_terms
  # POST /glossary_terms.json
  def create
    @glossary_term = GlossaryTerm.new(glossary_term_params)
    @book = @glossary_term.book

    respond_to do |format|
      if @glossary_term.save
        format.html { redirect_to glossary_term_path(@glossary_term), notice: 'Glossary term was successfully created.' }
        format.json { render :show, status: :created, location: @glossary_term }
      else
        format.html { render :new }
        format.json { render json: @glossary_term.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /glossary_terms/1
  # PATCH/PUT /glossary_terms/1.json
  def update
    @book = @glossary_term.book
    respond_to do |format|
      if @glossary_term.update(glossary_term_params)
        format.html { redirect_to glossary_term_path(@glossary_term), notice: 'Glossary term was successfully updated.' }
        format.json { render :show, status: :ok, location: @glossary_term }
      else
        format.html { render :edit }
        format.json { render json: @glossary_term.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /glossary_terms/1
  # DELETE /glossary_terms/1.json
  def destroy
    @book = @glossary_term.book
    @glossary_term.destroy
    respond_to do |format|
      format.html { redirect_to book_glossary_terms_url(@book), notice: 'Glossary term was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_glossary_term
      @glossary_term = GlossaryTerm.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:book_id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def glossary_term_params
      params.require(:glossary_term).permit(:name, :body, :see_id, :seealso_id, :acronym_id, :user_id, :book_id)
    end
end
