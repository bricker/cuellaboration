class Note < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
    
  belongs_to :notable, polymorphic: true
  belongs_to :collaborator
end
