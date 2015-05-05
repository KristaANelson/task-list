class List < ActiveRecord::Base
  has_many :tasks

  scope :active, -> { where(archieved: false) }
  scope :archieved, -> { where(archieved: true) }
end
