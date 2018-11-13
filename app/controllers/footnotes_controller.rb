class FootnotesController < ApplicationController
  before_action :set_footnote, only: [:show, :edit, :update, :destroy]

  def index
      @noted = find_notable
      @footnotes = @noted.footnotes
  end

  # GET /footnotes/1
  # GET /footnotes/1.json
  def show
    @noted = find_notable
    @noted = @footnote
  end

  # GET /footnotes/section
  def new
    @noted = find_notable
    @footnote = Footnote.new(:noted => @noted, :slug=>params[:slug])
    @footnote.noted = @noted
  end

#  # GET /footnotes/chapter
#  def chapter
#    @noted = Chapter.find(params[:chapter_id])
#    @footnote = Footnote.new(:noted => @noted, :slug=>params[:slug])
#    @footnote.noted = @noted
#  end

  # GET /footnotes/1/edit
  def edit
  end

  # POST /footnotes
  # POST /footnotes.json
  def create
    @footnote = Footnote.new(footnote_params)
    @noted = find_notable

    respond_to do |format|
      if @footnote.save
          format.html {
              case @footnote.noted_type
              when 'Chapter'
                  redirect_to book_chapter_url(:book_id => @footnote.noted.book.id, :id => @footnote.noted.id), notice: 'Footnote was successfully created.' 
              when 'HoloceneEvent'
                  redirect_to holocene_event_url(:id => @footnote.noted.id), notice: 'Footnote was successfully created.' 
              when 'Section'
                  redirect_to book_chapter_section_url(:book_id => @footnote.noted.chapter.book.id, :chapter_id => @footnote.noted.chapter.id, :id => @footnote.noted.id), notice: 'Footnote was successfully created.' 
              end
          }
        format.json { render :show, status: :created, location: @footnote }
      else
        format.html { render :new }
        format.json { render json: @footnote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /footnotes/1
  # PATCH/PUT /footnotes/1.json
  def update
    @noted = @footnote.noted
    respond_to do |format|
      if @footnote.update(footnote_params)
        format.html {
              case @footnote.noted_type
              when 'Chapter'
                  redirect_to book_chapter_url(:book_id => @footnote.noted.book.id, :id => @footnote.noted.id), notice: 'Footnote was successfully updated.' 
              when 'HoloceneEvent'
                  redirect_to holocene_event_url(:id => @footnote.noted.id), notice: 'Footnote was successfully updated.' 
              when 'Section'
                  redirect_to book_chapter_section_url(:book_id => @footnote.noted.chapter.book.id, :chapter_id => @footnote.noted.chapter.id, :id => @footnote.noted.id), notice: 'Footnote was successfully updated.' 
              end
        }
        format.json { render :show, status: :ok, location: @footnote }
      else
        format.html { render :edit }
        format.json { render json: @footnote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /footnotes/1
  # DELETE /footnotes/1.json
  def destroy
    @noted = @footnote.noted
    @footnote.destroy
    respond_to do |format|
      format.html {
          case @noted.class.name
          when "Chapter"
              redirect_to chapter_footnotes_url(:chapter_id => @noted.id), notice: 'Footnote was successfully destroyed.' 
          when "Section"
              redirect_to section_footnotes_url(:section_id => @noted.id), notice: 'Footnote was successfully destroyed.' 
          
          when "HoloceneEvent"
              redirect_to holocene_event_footnotes_url(:holocene_event_id => @noted.id), notice: 'Footnote was successfully destroyed.' 
          end
      }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_footnote
      @footnote = Footnote.find(params[:id])
    end

    def find_notable
      params.each do |name, value|
        if name =~ /(.+)_id$/
          return $1.classify.constantize.find(value)
        end
      end
      nil
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def footnote_params
      params.require(:footnote).permit(:slug, :body, :noted_id, :noted_type)
    end
end
