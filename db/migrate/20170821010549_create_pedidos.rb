class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|
      
      t.timestamp :data
      t.integer :status
         
      t.timestamps
    end
  end
end
