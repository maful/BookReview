class Author < ApplicationRecord
  validates :name, presence: true, length: { minimum: 5 }
  validates :biography, presence: true, length: { minimum: 20 }

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end
end
