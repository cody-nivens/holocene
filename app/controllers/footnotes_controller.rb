class FootnotesController < ApplicationController
  before_action :set_footnote, only: %i[show edit update destroy]

  def index
    @noted = find_notable
    @footnotes = @noted.footnotes

    respond_to do |format|
      format.turbo_stream { render "shared/index", locals: { object: Footnote.new, objects: @footnotes } }
    end
  end

  # GET /footnotes/1
  # GET /footnotes/1.json
  def show
    @noted = @footnote.noted

    respond_to do |format|
      format.turbo_stream { render "shared/show", locals: { object: @footnote } }
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
    @short = params[:short]
    @noted = @footnote.noted
  end

  # POST /footnotes
  # POST /footnotes.json
  def create
    @footnote = Footnote.new(footnote_params)
    @noted = @footnote.noted

    respond_to do |format|
      if @footnote.save
        @footnotes = @noted.footnotes
        flash.now[:notice] = "Footnote was successfully created."
#        format.html do
#          redirect_to "/#{@noted.class.name.underscore.pluralize}/#{@noted.id}/footnote/#{@footnote.id}",
#                      only_path: true,
#                      notice: 'Footnote was successfully created'
#        end
        format.json { render :show, status: :created, location: @footnote }
        #format.turbo_stream { render "index", locals: { "#{@noted.class.name.underscore}": @noted, long: nil } }
        format.turbo_stream { render "shared/index", locals: { object: Footnote.new, objects: @footnotes } }
      else
        format.html { render :new }
        format.json { render json: @footnote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /footnotes/1
  # PATCH/PUT /footnotes/1.json
  def update
    @short = params[:short]
    @noted = @footnote.noted
    respond_to do |format|
      if @footnote.update(footnote_params)
#        format.html do
#          redirect_to "/#{@noted.class.name.underscore.pluralize}/#{@noted.id}/footnote/#{@footnote.id}",
#                      only_path: true,
#                      notice: 'Footnote was successfully updated'
#        end
        format.json { render :show, status: :ok, location: @footnote }
        flash.now[:notice] = "Footnote was successfully updated."
        format.turbo_stream { render "shared/update", locals: { object: @footnote, short: @short } }
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
      flash.now[:now] = "Footnote was successfully destroyed."
      format.turbo_stream { render "shared/destroy", locals: { object: Footnote.new } }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_footnote
    @footnote = Footnote.find(params[:id].nil? ? params[:footnote_id] : params[:id])
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
