class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|      
      t.integer :status, null: false
      t.float :numero_nf
      t.float :total, null: false, default: 0
            
      t.references :user
         
      t.timestamps
    end
  end
end
