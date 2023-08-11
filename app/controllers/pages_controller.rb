class PagesController < ApplicationController
  before_action :set_page, only: %i[ show edit update destroy ]

  # GET /pages or /pages.json
  def index
    @pages = current_user.pages
    respond_to do |format|
      format.turbo_stream { render "shared/index", locals: { object: Page.new, objects: @pages } }
    end
  end

  # GET /pages/1 or /pages/1.json
  def show
    respond_to do |format|
      format.turbo_stream { render "shared/show", locals: { object: @page, no_new_link: true } }
    end
  end

  # GET /pages/about/view
  def view
    @page = Page.where(slug: params[:slug])[0]
    respond_to do |format|
      format.turbo_stream { render "shared/show", locals: { object: @page, part: 'view', no_new_link: true } }
    end
  end

  # GET /pages/new
  def new
    @page = Page.new
    @page.user = current_user
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages or /pages.json
  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        @pages = current_user.pages
        format.html { redirect_to page_url(@page), notice: "Page was successfully created." }
        format.json { render :show, status: :created, location: @page }
        flash.now[:notice] = "Page was successfully created."
        format.turbo_stream { render "shared/index", locals: { object: Page.new, objects: @pages } }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1 or /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        @pages = current_user.pages
        format.html { redirect_to page_url(@page), notice: "Page was successfully updated." }
        format.json { render :show, status: :ok, location: @page }
        flash.now[:notice] = "Page was successfully updated."
        format.turbo_stream { render "shared/update", locals: { object: @page, short: @short } }

      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1 or /pages/1.json
  def destroy
    @page.destroy
    @pages = current_user.pages

    respond_to do |format|
      format.html { redirect_to pages_url, notice: "Page was successfully destroyed." }
      format.json { head :no_content }
      flash.now[:notice] = "Page was successfully destroyed."
      format.turbo_stream { render "shared/destroy", locals: { object: Page.new } }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def page_params
      params.require(:page).permit(:name, :user_id, :slug, :body)
    end
end
