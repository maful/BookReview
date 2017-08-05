class Author < ApplicationRecord
  validates :name, presence: true, length: { minimum: 5 }
  validates :biography, presence: true, length: { minimum: 20 }

  has_many :books, dependent: :destroy

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end
end
