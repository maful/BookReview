class Book < ApplicationRecord
  mount_uploader :cover, CoverUploader

  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 20 }
  validates :price, presence: true
  validates :author_id, presence: true
  validates :cover, presence: true
  validates_processing_of :cover
  validate :cover_size_validation

  belongs_to :author

  def self.search(search)
    where("title LIKE ?", "%#{search}%")
  end

  private
    def cover_size_validation
      errors[:cover] << "should be less than 500KB" if cover.size > 0.5.megabytes
    end
end
