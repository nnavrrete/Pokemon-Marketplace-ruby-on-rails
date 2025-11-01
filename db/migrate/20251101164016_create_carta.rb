class CreateCarta < ActiveRecord::Migration[8.1]
  def change
    create_table :carta do |t|
      t.string :nombre
      t.string :tipo
      t.string :rareza
      t.string :imagen_url

      t.timestamps
    end
  end
end
