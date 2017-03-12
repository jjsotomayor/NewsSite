class Story < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :subtitle, length: {maximum: 250}
end
