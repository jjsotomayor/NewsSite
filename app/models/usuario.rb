class Usuario < ApplicationRecord
  validates :usuario, :nombre, presence: true
end
