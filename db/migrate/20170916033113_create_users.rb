class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nome
      t.string :cpf
      t.string :tel_fixo
      t.string :tel_cel
      t.string :email
      t.string :password
      t.string :password_confirmation
      t.belongs_to :endereco, index: true
      
      
      
      
      t.timestamps
    end
  end
end
