class Task < ActiveRecord::Base
  belongs_to :list

  validates :title, :description, :due_date, presence: true


  scope :incompleted, -> { where(complete: false) }
  scope :completed, -> { where(complete: true) }
end
