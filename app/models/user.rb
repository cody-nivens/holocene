class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :assign_default_role

  has_many :authors
  has_many :biblioentries
  has_many :event_types
  has_many :holocene_events
  has_many :regions
  has_many :timelines
  has_many :books
  has_many :glossary_terms

  def assign_default_role
    self.add_role(:newuser) if self.roles.blank?
  end
end
