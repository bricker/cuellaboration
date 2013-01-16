class Cue < ActiveRecord::Base
  belongs_to :project
  has_many :versions
  has_many :notes, as: :notable
end
