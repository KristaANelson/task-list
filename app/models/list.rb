class List < ActiveRecord::Base
  has_many :tasks

  validates :title, presence: true
  
  scope :active, -> { where(archived: false) }
  scope :archived, -> { where(archived: true) }
end
