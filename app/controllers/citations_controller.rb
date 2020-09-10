class CitationsController < ApplicationController
  before_action :set_chapter, only: [:index, :update ]

  # GET /citations
  # GET /citations.json
  def index
    @citation = Footnote.new
    @citations = @chapter.citations.includes(:biblioentry).order("biblioentries.name")
    @biblioentries = @citations.collect{|x| x.biblioentry}.sort.uniq
    all_citations = Footnote.includes(:biblioentry).where(slug: "").order("biblioentries.name")
    @all_citations = []
    all_citations.each do |citation|
      @all_citations << citation.biblioentry unless @all_citations.include?(citation.biblioentry) || @biblioentries.include?(citation.biblioentry)
    end
  end

  # PATCH/PUT /citations/1
  # PATCH/PUT /citations/1.json
  def update
    unless params[:cit_ids].blank?
      params[:cit_ids].each do |id|
        chit = Footnote.find(id)
        chit.destroy
      end
    end
    unless params[:biblioentries_ids].blank?
      params[:biblioentries_ids].each do |id|
        footnote = Footnote.create(slug: "", biblioentry_id: id)
        footnote.noted = @chapter
        footnote.save
      end
    end

    respond_to do |format|
        format.html { redirect_to chapter_citations_url, notice: 'Citations were successfully updated.' }
        format.json { render :show, status: :ok, location: @citation }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chapter
      @chapter = Chapter.find(params[:chapter_id])
    end
end
