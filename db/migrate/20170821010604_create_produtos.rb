class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string :produto
      t.integer :qtd_estoque
      t.string :desc_produto
      t.float :valor_pago
      t.float :valor_venda     
      
      t.references :tipo_produto
         
      t.timestamps
    end
  end
end
