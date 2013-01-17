class Cue < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
    
  belongs_to :project
  has_many :versions, dependent: :destroy
  has_many :notes, as: :notable, dependent: :destroy
  
  validates :project, :title, presence: true
end
