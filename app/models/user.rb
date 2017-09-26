class User < ActiveRecord::Base
  has_one :pedido
  belongs_to :endereco
  
 # scope :co_pedido, ->  User.joins(:pedido)
  
  
  
end
