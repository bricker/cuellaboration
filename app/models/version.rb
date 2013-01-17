class Version < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
    
  belongs_to :cue
  has_many :notes, as: :notable, dependent: :destroy
end
