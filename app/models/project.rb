class Project < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
    
  has_many :cues, dependent: :destroy
  has_many :project_collaborators, dependent: :destroy
  has_many :collaborators, through: :project_collaborators
end
