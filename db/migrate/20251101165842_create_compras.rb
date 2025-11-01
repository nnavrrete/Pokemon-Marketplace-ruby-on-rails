class CreateCompras < ActiveRecord::Migration[8.1]
  def change
    create_table :compras do |t|
      t.references :comprador, null: false, foreign_key: { to_table: :usuarios }
      t.references :publicacion, null: false, foreign_key: true
      t.integer :cantidad
      t.decimal :total

      t.timestamps
    end
  end
end
