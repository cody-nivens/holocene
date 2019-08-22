class Footnote < ApplicationRecord
  belongs_to :noted, polymorphic: true
  belongs_to :biblioentry, optional: true

  validates :slug, presence: true, unless: ->(footnote){footnote.biblioentry_id.present?}
  validates :biblioentry_id, presence: true, unless: ->(footnote){footnote.slug.present?}

  #
  # Generate a random slug if none is give my user
  #
  def self.random_slug(length=10)
    chars = 'abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ0123456789'
    slug = ''
    length.times { slug << chars[rand(chars.size)] }
    return slug
  end


end
