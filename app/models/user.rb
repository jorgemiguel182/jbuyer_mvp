class User < ActiveRecord::Base
  has_many :pedidos
  belongs_to :endereco
  
 # scope :co_pedido, ->  User.joins(:pedido)
  
  
  
end
