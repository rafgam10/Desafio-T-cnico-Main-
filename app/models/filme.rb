class Filme < ApplicationRecord

  belongs_to :user
  has_many :comentarios, dependent: :destroy

end
