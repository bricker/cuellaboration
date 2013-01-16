class Version < ActiveRecord::Base
  belongs_to :cue
  has_many :notes, as: :notable
end
