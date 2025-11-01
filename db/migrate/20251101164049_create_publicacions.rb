class CreatePublicacions < ActiveRecord::Migration[8.1]
  def change
    create_table :publicacions do |t|
      t.references :usuario, null: false, foreign_key: true
      t.references :carta, null: false, foreign_key: true
      t.decimal :precio
      t.string :estado

      t.timestamps
    end
  end
end
