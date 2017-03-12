class Comment < ApplicationRecord
  belongs_to :story

  validates :author, :content, presence: true
end
