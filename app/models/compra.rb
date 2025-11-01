class Compra < ApplicationRecord
  belongs_to :comprador, class_name: "Usuario"
  belongs_to :publicacion
end
