class CreateEnderecos < ActiveRecord::Migration
  def change
    create_table :enderecos do |t|
      t.string :rua
      t.string :bairro
      t.string :cidade
      t.string :uf
      t.integer :cep
      t.string :referencia
      t.string :numero
      t.string :complemento
      
      

      t.timestamps
    end
  end
end
