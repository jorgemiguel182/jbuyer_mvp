class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string :produto
      t.float :valor
      t.integer :pedido_id
      
       t.belongs_to :produto, index: true
 
      t.timestamps
    end
  end
end
