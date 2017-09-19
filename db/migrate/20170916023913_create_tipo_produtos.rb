class CreateTipoProdutos < ActiveRecord::Migration
  def change
    create_table :tipo_produtos do |t|
      t.string :nome_tipo
      t.string :desc_tipo
      
      t.timestamps
    end
  end
end
