class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_many :chat_rooms, dependent: :destroy
         has_many :messages, dependent: :destroy
         attr_accessor :login
         validates :username, :presence => true, :uniqueness => { :case_sensitive => false }
         validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  def name
    username
  end

  def self.find_for_database_authentication warden_conditions
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).where(["lower(username) = :value OR lower(email) = :value", {value: login.strip.downcase}]).first
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
