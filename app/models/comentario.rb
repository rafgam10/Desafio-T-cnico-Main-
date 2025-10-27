class Comentario < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :filme
end
