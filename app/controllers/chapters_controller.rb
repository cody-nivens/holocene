class ChaptersController < ApplicationController
  before_action :set_chapter, only: [:promote, :demote, :geo_map, :pdf, :holocene_events, :sections, :show, :edit, :update, :destroy]
  before_action :set_scripted, only: [ :index, :create, :new ]

  def index
       @chapters = @scripted.chapters.order(:position).all
  end

  def geo_map
      @object = @chapter
  end

  def demote
    @scripted = @chapter.scripted

    @prev_chapter = @chapter.set_prev
    position = 0

    if @prev_chapter.nil?
      @prev_chapter = @chapter
    end

    @prev_chapter.sections.order(:position).each do |section|
      section.update({:position => position})
      position += 1
    end

    position = (@prev_chapter.sections.last.nil? ? 0 : @prev_chapter.sections.last.position + 1)

    new_section = Section.create({name: @chapter.name, body: @chapter.body, chapter_id: @prev_chapter.id,position: position})
    position += 1

    @chapter.citations.each do |citation|
      citation.update({:noted_id => @prev_chapter.id}) unless @prev_chapter.citations.include?(citation)
    end

    @chapter.holocene_events.each do |holocene_event|
      @prev_chapter.holocene_events << holocene_event unless @prev_chapter.holocene_events.include?(holocene_event)
    end

    @chapter.sections.order(:position).each do |section|
      section.update({:chapter_id => @prev_chapter.id, :position => position})
      position += 1
    end

    @chapter.destroy

    respond_to do |format|
        format.html { redirect_to polymorphic_path([@scripted, :chapters]), notice: 'Chapter was demoted.' }
    end
  end

  def promote
    @section = Section.find(params[:section_id])
    @scripted = @chapter.scripted

    @next_chapter = @chapter.set_next
    position = 0

    if @next_chapter.nil?
      @next_chapter = @chapter
    end


    @scripted.chapters.where("position > ?",@next_chapter.position).order(:position).each do |chapter|
      chapter.update({:position => position})
      position += 1
    end

    position = @next_chapter.position
    @new_chapter = Chapter.create({:name => @section.name, :body => @section.body,:position => position, :scripted => @scripted})

    @chapter.sections.where("position > ?",@section.position).order(:position).each do |section|
      section.update({:position => position})
      section.update({:chapter_id => @new_chapter.id})
      position += 1
    end

    @section.destroy

    respond_to do |format|
        format.html { redirect_to polymorphic_path([@scripted, :chapters]), notice: 'Chapter was successfully created from Section.' }
    end
  end

      #format.pdf {
      #  render pdf: "chapter_#{@chapter.id}",
      #    disposition: 'attachment',
      #    header: { right: '[page] of [topage]' },
      #    toc: {
      #      disable_dotted_lines: true,
      #      disable_toc_links: true,
      #      level_indentation: 3,
      #      header_text: 'Climate and History',
      #      text_size_shrink: 0.5
      #    }
      #}
  # GET /chapters/1
  # GET /chapters/1.json
  def show
    @notes = {}
    @sections = @chapter.sections.order(:position)
    respond_to do |format|
      format.html { render :show, locals: { epub: false }}
    end
  end

  # GET /chapters/new
  def new
    @chapter = Chapter.new
    @chapter.scripted = @scripted
  end

  # GET /chapters/1/edit
  def edit
    @scripted = @chapter.scripted
  end

  # POST /chapters
  # POST /chapters.json
  def create
    @chapter = Chapter.new(chapter_params)

    respond_to do |format|
      if @chapter.save
        @chapter.reload
        format.html { redirect_to @chapter, notice: 'Chapter was successfully created.' }
        format.json { render :show, status: :created, location: @chapter }
      else
        format.html { render :new }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chapters/1
  # PATCH/PUT /chapters/1.json
  def update
    @scripted = @chapter.scripted
    respond_to do |format|
      if @chapter.update(chapter_params)
        format.html { redirect_to @chapter, notice: 'Chapter was successfully updated.' }
        format.json { render :show, status: :ok, location: @chapter }
      else
        format.html { render :edit }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chapters/1
  # DELETE /chapters/1.json
  def destroy
    @scripted = @chapter.scripted
    @chapter.destroy
    respond_to do |format|
      format.html { redirect_to polymorphic_path([@scripted, :chapters]), notice: 'Chapter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chapter
      @chapter = Chapter.find(params[:id])
    end

    def set_scripted
      @klass = (params[:chapter].nil? || params[:chapter][:scripted_type].empty? ? params[:scripted_type] : params[:chapter][:scripted_type]).capitalize.constantize
      @scripted = @klass.find((params[:chapter].nil? || params[:chapter][:scripted_id].empty? ? params["#{@klass.name.underscore}_id"] : params[:chapter][:scripted_id]))
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chapter_params
      params.require(:chapter).permit(:name, :body, :position, :scripted_id, :scripted_type, :position, :aside, :show_events, :always_display_events, :display_title, :scripted_id, :scripted_type)
    end
end
