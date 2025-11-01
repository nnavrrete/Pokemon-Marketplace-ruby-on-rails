class CreateHistorialPrecios < ActiveRecord::Migration[8.1]
  def change
    create_table :historial_precios do |t|
      t.references :carta, null: false, foreign_key: true
      t.decimal :precio
      t.datetime :fecha

      t.timestamps
    end
  end
end
