class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nome
      t.integer :cpf
      t.string :tel_fixo
      t.string :tel_cel
      t.string :email
      
      t.references :endereco
      
      
      t.timestamps
    end
  end
end
