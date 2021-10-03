class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # User::Roles
  # The available roles
  Roles = [ :admin , :editor, :author, :default ]

  def is?( requested_role )
    has_role?(requested_role)
  end

  after_create :assign_default_role

  has_and_belongs_to_many :roles, join_table: :users_roles

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
  has_many :section
  has_many :timeline

  def assign_default_role
    add_role(:newuser) if roles.blank?
  end

  def password_required?
    new_record? || password.present? || password_confirmation.present?
  end
end
