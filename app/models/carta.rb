class Carta < ApplicationRecord
    has_many :publicaciones
    has_many :historial_precios
end
