class Contact < ApplicationRecord
  validates :name, presence: true
  validates :content, length: { in: 1..140 }
  validates :email, presence: true, length: { maximum: 255 },
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
end
