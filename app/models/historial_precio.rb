class HistorialPrecio < ApplicationRecord
  belongs_to :carta, foreign_key: "carta_id"
end
