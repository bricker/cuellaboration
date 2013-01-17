class Collaborator < ActiveRecord::Base  
  include ActiveModel::ForbiddenAttributesProtection
    
  #--------------------
  
  scope :active, -> { where(active: true) }
  
  #--------------------
  
  has_many :notes, dependent: :nullify
  has_many :project_collaborators, dependent: :destroy
  has_many :projects, through: :project_collaborators
  
  #--------------------
  
  validates :password, presence: true, on: :create
  validates :email, uniqueness: true, presence: true
  validates :name, presence: true
  
  #--------------------
  
  has_secure_password  
  attr_accessor :password_confirmation

  before_validation :generate_password, on: :create, if: -> { self.password.blank? }
  before_save :downcase_email, if: -> { self.email_changed? }
  
  #--------------------
  # Downcase the e-mail so validating uniqueness is accurate and fast
  def downcase_email
    self.email = self.email.downcase
  end
  
  #--------------------
  
  class << self
    #-------------------- 
    # Authenticate a user by email and password
    # Returns the user or nil
    def authenticate(info)
      email    = info[:email].downcase
      password = info[:password]
      user     = self.active.find_by_email(email)
    
      user.try(:authenticate, password) ? user : false
    end
  end
  
  #--------------------
  # Generate a random password
  # Also set the confirmation for validation
  def generate_password
    self.password = SecureRandom.urlsafe_base64(10)
    self.password_confirmation = self.password
  end
end
