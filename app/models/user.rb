class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :assign_default_role

  has_many :author
  has_many :biblioentry
  has_many :book
  has_many :epoch
  has_many :event_type
  has_many :footnote
  has_many :glossary_term
  has_many :holocene_event
  has_many :metric
  has_many :region
  has_many :role
  has_many :timeline

  def assign_default_role
    self.add_role(:newuser) if self.roles.blank?
  end
end
