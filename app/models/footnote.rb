class Footnote < ApplicationRecord
  belongs_to :noted, polymorphic: true
  belongs_to :biblioentry, optional: true

  has_rich_text :body

  validates :slug, presence: true, unless: ->(footnote) { footnote.biblioentry_id.present? }
  validates :biblioentry_id, presence: true, unless: ->(footnote) { footnote.slug.present? }

  delegate :xreflabel, :name, to: :biblioentry, prefix: true

  def name
    body.to_plain_text[0..19]
  end

  #
  # Generate a random slug if none is give my user
  #
  def self.random_slug(length = 10)
    chars = 'abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ0123456789'
    slug = ''
    length.times { slug << chars[rand(chars.size)] }
    slug
  end

  def self.process_body(object, _slugs, index = 1)
    footnote_slugs = []
    my_body = object.body.to_s.gsub(/&nbsp;/, '')
    while my_m = my_body.match(/\[\[([^ ]*)\]\]/)
      my_body.gsub!(/\[\[#{my_m[1]}\]\]/,
                    "<sup><a href=\"#fn#{index}\" data-turbolinks='false' id=\"ref#{index}\">[#{index}]</a></sup>")
      footnote_slugs << [my_m[1], object, index]
      index += 1
    end
    [my_body, footnote_slugs, index]
  end

  def self.write_footnotes(slugs)
    str = '<hr/>'
    index = 1
    slugs.each do |slug|
      my_footnote = slug[1].footnotes.where(slug: slug[0].gsub(/#{slug[1].slug}/, ''))
      index = slug[2]
      if my_footnote.length == 0
        str += "<a href='/#{slug[1].class.name.underscore.pluralize}/#{slug[1].id}/footnotes/#{slug[0]}'>Missing footnote</a><br/>"
      else
        footnote = (my_footnote[0].biblioentry.nil? ? my_footnote[0].body.to_plain_text : my_footnote[0].biblioentry.name)
        str += "<sup id='fn#{index}'>#{index}. [#{footnote}]<a href='#ref#{index}' data-turbolinks='false' title='Jump back to footnote #{index} in the text.'>↩</a></sup><br/>"
      end
    end
    str
  end
end
