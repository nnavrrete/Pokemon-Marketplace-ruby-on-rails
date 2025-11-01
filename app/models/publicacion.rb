class Publicacion < ApplicationRecord
  belongs_to :usuario
  belongs_to :carta, foreign_key: "carta_id"
  has_many :historial_precios

  after_create :registrar_historial_precio

  private

  def registrar_historial_precio
    HistorialPrecio.create!(
      carta: carta,
      precio: precio,
      fecha: Time.now
    )
  end
end