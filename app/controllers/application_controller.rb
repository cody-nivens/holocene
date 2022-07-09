class ApplicationController < ActionController::Base
  include Pagy::Backend
  #load_and_authorize_resource
#  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from SecurityError do |exception| redirect_to root_path end
  rescue_from CanCan::AccessDenied do | exception | redirect_to root_path, alert: exception.message end

  before_action :authenticate_user!
  before_action :set_footer_content
  helper_method :set_prev_chapter, :set_next_chapter
  helper_method :selector_string, :selector_collection

  before_action :set_title
  before_action :set_book_from_session

  after_action :set_return_to_location

  REDIRECT_CONTROLLER_BLACKLIST = %w(
    sessions
    user_sessions
  )

  def set_return_to_location
    return unless request.get?
    return unless request.format.html?
    return unless %w(show index edit).include?(params[:action])
    return if REDIRECT_CONTROLLER_BLACKLIST.include?(controller_name)
    session[:return_to] = request.fullpath
  end

  def return_or_default_path(default_path)
    the_path = session[:return_to].present? && session[:return_to] != request.fullpath ?
                    session[:return_to] : default_path
    session.delete(:return_to) if session[:return_to].present? && session[:return_to] != request.fullpath
    the_path
  end

  def redirect_back_or_default(default_path, options = {})
    default_path ||= root_path
    flash[:notice] = options[:notice]
    redirect_to(
      return_or_default_path(default_path)
    )
  end

  def set_book_from_session
    book = if session[:book_id].nil?
             nil
           else
      Book.find_by_id(session[:book_id])
           end
    @book = book
  end

  def about; end

  def secret; end

  def contact; end

  def faq; end

  def selector_string(selector)
    case selector
    when 1
      'First Plot Point'
    when 2
      'First Pinch Point'
    when 3
      'Midpoint'
    when 4
      'Second Pinch Point'
    when 5
      'Third Plot Point'
    when 6
      'Climax'
    end
  end

  def selector_collection
    s = []
    1.upto(6).each do |i|
      s << [selector_string(i), i]
    end
    s
  end

  def add_background_events(_object)
    events = HoloceneEvent.where(user_id: current_user.id).order(:start_year)
    my_ids = []
    unless events.size == 0
      start_year = events.minimum(:start_year)
      end_year = events.maximum(:start_year)

      t_events = HoloceneEvent.where('user_id = ?', current_user.id)

      case1 = t_events.where('start_year >= ?', start_year).where('start_year <= ?', end_year)
      case2 = t_events.where('start_year >= ?', start_year).where('start_year <= ?',
                                                                  end_year).where('end_year is not null')
      case3 = t_events.where('end_year is not null').where('end_year >= ?', start_year).where('end_year <= ?', end_year)
      case4 = t_events.where('start_year >= ?', start_year).where('(start_year - start_year_uncert) <= ?', end_year)
      case5 = t_events.where('start_year >= ?', end_year).where('(start_year + start_year_uncert) <= ?', start_year)
      my_ids = (case1.ids + case2.ids + case3.ids + case4.ids + case5.ids).uniq
    end
    my_ids
  end

   #
  # redirect registered users to a profile page
  # of to the admin dashboard if the user is an administrator
  #
  def after_sign_in_path_for(resource)
    #resource.has_role?(:admin) ? admin_dashboard_path : user_path(resource)
    #resource.has_role?(:admin) ? admin_dashboard_path : root_path
    root_path
  end

  def authenticate_admin_user!
    raise SecurityError unless current_user.has_role?(:admin)
  end

  private

  def set_footer_content
    @footer_content = []
  end

  def set_title
    @title = request.controller_class.to_s.gsub(/Controller/, '')
  end
end

require 'gepub'
class BookEPub
  def initialize(book)
    @book = book
    @ebook = GEPUB::Book.new
  end

  def build
    @ebook.primary_identifier('http://example.com/bookid_in_url', 'BookID', 'URL')
    @ebook.language = 'en'

    @ebook.add_title @book.name,
                     title_type: GEPUB::TITLE_TYPE::MAIN,
                     lang: 'en',
                     file_as: @book.name,
                     display_seq: 1

    author_str = ''
    idx = 1
    @book.authors.each do |author|
      @ebook.add_creator "#{author.first_name} #{author.last_name}", display_seq: idx
      author_str += "#{author.first_name} #{author.last_name},"
      idx += 1
    end

    author_str = author_str.gsub(/^ /, '').gsub(/,$/, '')

    imgfile = File.join(File.dirname(__FILE__), '../../app/assets/images/image1.jpg')
    File.open(imgfile) do |io|
      @ebook.add_item('img/image1.jpg', content: io).cover_image
    end

    css_file = File.join(File.dirname(__FILE__), '../../main.css')
    File.open(css_file) do |io|
      @ebook.add_item('css/main.css', content: io)
    end

    @ebook.ordered do
      @ebook.add_item('text/cover.xhtml',
                      content: StringIO.new(<<-COVER)).landmark(type: 'cover', title: 'cover page')
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>#{@book.name}</title>
    <link rel="stylesheet" href="../css/main.css" type="text/css" media="all" />
  </head>
  <body>
    <h1>#{@book.name}</h1>
    <div class="cover">
      <img src="../img/image1.jpg" />
    </div>
  </body></html>
                  COVER

  @ebook.add_item('text/title_page.xhtml',
                  content: StringIO.new(<<-TITLE_PAGE)).landmark(type: 'titlepage', title: 'title page')
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Title Page</title>
    <link rel="stylesheet" href="../css/main.css" type="text/css" media="all" />
  </head>
  <body>
    <div class="title">
      <h1 class="center">#{@book.name}</h1>
      <h2 class="center">#{@book.sub_name}</h2>
      <h1 class="center">#{author_str}</h1>
      <hr/>
      <h2 class="center">#{@book.publisher}</h2>
    </div>
  </body></html>
                      TITLE_PAGE

  @ebook.add_item('text/copyright_page.xhtml',
                  content: StringIO.new(<<-COPYRIGHT_PAGE)).landmark(type: 'copyright-page', title: 'copyright page')
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Copyright</title>
    <link rel="stylesheet" href="../css/main.css" type="text/css" media="all" />
  </head>
  <body>
    <p class="no-indent">#{author_str}</p>
    <p class="no-indent">Copyright &#169; #{@book.copyright}</p>
    <p class="no-indent">While every precaution has been taken in the
                 preparation of this book, the publisher and author assumes no
                 responsibility for errors or omissions, or for damages resulting
                 from the use of the information contained herein.</p>
  </body></html>
                      COPYRIGHT_PAGE

  if @book.is_fiction?
    chap_index = 1
    @book.stories.includes([{ key_points: { scenes: [:artifact, :rich_text_place, :rich_text_summary,
                                                     :key_point, { section: :rich_text_body }] } }]).order(:position).each do |story|
     next unless story.publish?

 @ebook.add_item("text/#{story.name.downcase.gsub(/ /, '_').gsub(/[-',]/, '')}.xhtml").add_content(StringIO.new(<<~CHAP_ONE)).toc_text(story.name).landmark(type: 'story', title: story.name)
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>#{story.name}</title>
    <link rel="stylesheet" href="../css/main.css" type="text/css" media="all" />
  </head>
  <body>
    #{StoriesController.render partial: 'stories/show', formats: [:html], locals: { notes: @notes, book: @book, story: story, epub: true, pdf: true }}
  </body></html>
     CHAP_ONE
 chap_index += 1
   end
  else
    chap_index = 1
   @book.chapters.includes([:rich_text_body, { holocene_events: [:event_types, :rich_text_body, :region] }, { partition: :rich_text_body }, { aside: :rich_text_body }, { sections: :rich_text_body }]).each do |chapter|
 unless chapter.partition.nil?
      @ebook.add_item("text/#{chapter.slug}_p.xhtml").add_content(StringIO.new(<<~PARTITION)).toc_text(chapter.partition_name).landmark(type: 'part', title: chapter.partition_name)
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>#{chapter.partition_name}</title>
    <link rel="stylesheet" href="../css/main.css" type="text/css" media="all" />
  </head>
  <body>
    <h1>#{chapter.partition_name}</h1>
    #{chapter.partition.body}
  </body></html>
          PARTITION
    end
 @notes = []
 @ebook.add_item("text/#{chapter.slug}.xhtml").add_content(StringIO.new(<<~CHAP_ONE)).toc_text(chapter.name).landmark(type: 'chapter', title: chapter.name)
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>#{chapter.name}</title>
    <link rel="stylesheet" href="../css/main.css" type="text/css" media="all" />
  </head>
  <body>#{ChaptersController.render partial: 'chapters/show', formats: [:html], locals: { notes: @notes, book: @book, chapter: chapter, epub: true }}
  </body></html>
     CHAP_ONE
    chap_index += 1
   end

   @slugs = []
   s = ''
   @book.chapters.each do |chapter|
 unless chapter.citations.size == 0
   s += FootnotesController.render partial: 'footnotes/citations', formats: [:html],
                                                                              locals: { slugs: @slugs, footnotes: chapter.citations, chapter: chapter, links: false, title: nil }
 end
   end

   @ebook.add_item('text/citations.xhtml').add_content(StringIO.new(<<~CITATIONS)).toc_text('Citations').landmark(type: 'bodymatter', title: 'Citations')
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Citations</title>
    <link rel="stylesheet" href="../css/main.css" type="text/css" media="all" />
  </head>
  <body>
    <h1>Citations</h1>
    #{s}
  </body></html>
   CITATIONS

   @slugs = []
   @notes = {}
   @footnotes = []
   str = ''
   @book.chapters.order(:position).each do |chapter|
 next unless chapter.always_display_events

 unless chapter.holocene_events.size == 0
   chapter.holocene_events.order(:start_year).each do |he|
     if he.body.present?
       @footnotes = Footnote.process_body(he, @slugs, (@footnotes.nil? ? 1 : @footnotes[2]))
       @slugs += @footnotes[1]
     end
   end

   str += HoloceneEventsController.render partial: 'holocene_events/index', formats: [:html],
                                          locals: { holocene_events: chapter.holocene_events.order(:start_year), chapter: chapter, links: false,
                                                    epub: true, slugs: @slugs }
 end
 next if chapter.sections.size == 0
        chapter.sections.order(:position).each do |section|
          unless section.holocene_events.size == 0
            section.holocene_events.order(:start_year).each do |he|
              if he.body.present?
                @footnotes = Footnote.process_body(he, @slugs,
                                                       (@footnotes.nil? || @footnotes.empty? || @footnotes[2].nil? ? 1 : @footnotes[2]))
                @slugs += @footnotes[1]
              end
            end
            str += HoloceneEventsController.render partial: 'holocene_events/index', formats: [:html],
                                                   locals: { holocene_events: section.holocene_events.order(:start_year), chapter: chapter, links: false,
                                                             title: "#{chapter.name}:#{section.name}", epub: true, slugs: @slugs }
          end
        end
   end
   str += Footnote.write_footnotes(@slugs) unless @slugs.length == 0

   @ebook.add_item('text/events.xhtml').add_content(StringIO.new(<<~EVENTS)).toc_text('Chapter Events').landmark(type: 'bodymatter', title: 'Chapter Events')
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Chapter Events</title>
    <link rel="stylesheet" href="../css/main.css" type="text/css" media="all" />
  </head>
  <body>
    <h1>Chapter Events</h1>
    #{str}
  </body></html>
   EVENTS

   @ebook.add_item('text/glossary.xhtml').add_content(StringIO.new(<<~GLOSSTERMS)).toc_text('Glossary').landmark(type: 'bodymatter', title: 'Glossary')
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Glossary</title>
    <link rel="stylesheet" href="../css/main.css" type="text/css" media="all" />
  </head>
  <body>
    #{GlossaryTermsController.render partial: 'glossary_terms/index', formats: [:html], locals: { glossary_terms: @book.glossary_terms.order(:name) }}
  </body></html>
   GLOSSTERMS

   @ebook.add_item('text/bibliography.xhtml').add_content(StringIO.new(<<~BIBLIOTERMS)).toc_text('Bibliography').landmark(type: 'bodymatter', title: 'Bibliography')
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Bibliography</title>
    <link rel="stylesheet" href="../css/main.css" type="text/css" media="all" />
  </head>
  <body>
    #{BiblioentriesController.render partial: 'biblioentries/index', formats: [:html], locals: { biblioentries: @book.biblioentries }}
  </body></html>
   BIBLIOTERMS
  end
    end

    epubname = "#{Rails.root}/tmp/example_test.epub"

    # if you do not specify your own nav document with add_item,
    # simple navigation text will be generated in generate_epub.
    # auto-generated nav file will not appear on spine.
    @ebook.generate_epub(epubname)
  end
end
