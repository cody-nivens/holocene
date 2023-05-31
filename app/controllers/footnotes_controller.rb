class FootnotesController < ApplicationController
  before_action :set_footnote, only: %i[show edit update destroy]

  def index
    @noted = find_notable
    @footnotes = @noted.footnotes

    respond_to do |format|
#      format.html { render :index  }
      format.turbo_stream { }
    end
  end

  # GET /footnotes/1
  # GET /footnotes/1.json
  def show
    @noted = @footnote.noted

    respond_to do |format|
#      format.html { render :index  }
      format.turbo_stream { }
    end
  end

  # GET /footnotes/section
  def new
    @noted = find_notable
    @footnote = Footnote.new(noted: @noted, slug: params[:slug])
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
    @noted = @footnote.noted
  end

  # POST /footnotes
  # POST /footnotes.json
  def create
    @footnote = Footnote.new(footnote_params)
    @noted = @footnote.noted

    respond_to do |format|
      if @footnote.save
        flash.now[:notice] = "Footnote was successfully created."
#        format.html do
#          redirect_to "/#{@noted.class.name.underscore.pluralize}/#{@noted.id}/footnote/#{@footnote.id}",
#                      only_path: true,
#                      notice: 'Footnote was successfully created'
#        end
        format.json { render :show, status: :created, location: @footnote }
        format.turbo_stream { render "#{@noted.class.name.underscore.pluralize}/show", locals: { "#{@noted.class.name.underscore}": @noted, long: nil } }
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
#        format.html do
#          redirect_to "/#{@noted.class.name.underscore.pluralize}/#{@noted.id}/footnote/#{@footnote.id}",
#                      only_path: true,
#                      notice: 'Footnote was successfully updated'
#        end
        format.json { render :show, status: :ok, location: @footnote }
        format.turbo_stream { flash.now[:notice] = "Footnote was successfully updated." }
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
    @footnotes = @noted.footnotes

    respond_to do |format|
#      format.html do
#        redirect_to "/#{@noted.class.name.underscore.pluralize}/#{@noted.id}/footnotes",
#                    only_path: true,
#                    notice: 'Footnote was successfully destroyed'
#      end
      format.json { head :no_content }
      format.turbo_stream { flash.now[:notice] = "Footnote was successfully destroyed." }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_footnote
    @footnote = Footnote.find(params[:id])
  end

  def find_notable
    params.each do |name, value|
      return Regexp.last_match(1).classify.constantize.find(value) if name =~ /(.+)_id$/
    end
    nil
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def footnote_params
    params.require(:footnote).permit(:slug, :body, :noted_id, :noted_type, :biblioentry_id)
  end
end
