class CreatePedidosProdutos < ActiveRecord::Migration
  def change
    create_table :pedido_produtos do |t|
      t.references :pedido, index: true, null: true
      t.references :produto, index: true
      t.float :contador

      t.timestamps
    end
  end
end
