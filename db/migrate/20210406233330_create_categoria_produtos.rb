class CreateCategoriaProdutos < ActiveRecord::Migration[6.1]
  def change
    create_table :categoria_produtos do |t|
      t.string :title
      t.references :promotions, null: false, foreign_key: true

      t.timestamps
    end
  end
end
