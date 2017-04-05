class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_many :chat_rooms, dependent: :destroy
         has_many :messages, dependent: :destroy
         attr_accessor :login
         validates :username, :presence => true, :uniqueness => { :case_sensitive => false }
         validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  def name
    email.split('@')[0]
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
