class Task < ActiveRecord::Base
  belongs_to :list
  has_attached_file :file, storage: :s3, bucket: ENV['BUCKET_NAME']

  validates :title, :description, :due_date, presence: true
  validates_attachment_content_type :file,
  :content_type => ['application/pdf', 'image/png', 'image/jpeg'],
  :if => :pdf_attached?

  scope :incompleted, -> { where(complete: false) }
  scope :completed, -> { where(complete: true) }

  def pdf_attached?
    file.file?
  end
end
