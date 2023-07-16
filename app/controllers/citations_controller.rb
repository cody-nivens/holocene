class CitationsController < ApplicationController
  before_action :set_chapter, only: %i[index update]

  # GET /citations
  # GET /citations.json
  def do_index
    @citation = Footnote.new
    @citations = @chapter.citations.includes(:biblioentry).order('biblioentries.name')
    @noted = @chapter
    @biblioentries = @citations.collect { |x| x.biblioentry }.sort.uniq
    all_citations = Footnote.includes(:biblioentry).where(slug: '').order('biblioentries.name')
    @all_citations = []
    all_citations.each do |citation|
      unless @all_citations.include?(citation.biblioentry) || @biblioentries.include?(citation.biblioentry)
        @all_citations << citation.biblioentry
      end
    end
  end

  def index
    do_index
    respond_to do |format|
      format.turbo_stream { render "citations/index", locals: { object: Footnote.new, objects: @citations } }
    end
  end

  # PATCH/PUT /citations/1
  # PATCH/PUT /citations/1.json
  def update
    if params[:cit_ids].present?
      params[:cit_ids].each do |id|
        chit = Footnote.find(id)
        chit.destroy
      end
    end
    if params[:biblioentries_ids].present?
      params[:biblioentries_ids].each do |id|
        biblio = Biblioentry.find(id)
        footnote = Footnote.create(slug: '', body: biblio.name, biblioentry_id: id)
        footnote.noted = @chapter
        footnote.save
      end
    end

    respond_to do |format|
#      format.html do
#        redirect_to chapter_citations_url(chapter_id: @chapter.id), notice: 'Citations were successfully updated.'
#      end
      format.json { render :show, status: :ok, location: @citation }
      flash.now[:notice] = "Citation was successfully updated."
      format.turbo_stream do
        do_index
        render "citations/index", locals: { object: Footnote.new, objects: @citations }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_chapter
    @chapter = Chapter.find(params[:chapter_id])
  end
end
