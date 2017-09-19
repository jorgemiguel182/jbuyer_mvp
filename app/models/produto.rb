class Produto < ActiveRecord::Base
  
  belongs_to :tipo_produto 
  has_many :pedido_produtos
  has_many :pedidos, through: :pedido_produtos
  
end
