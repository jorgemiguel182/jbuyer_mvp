class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|      
      t.integer :status
      t.float :numero_nf
      t.float :total, null: false, default: 0
      t.date :data_compra
      
      t.references :user
         
      t.timestamps
    end
  end
end
