class User < ActiveRecord::Base
  has_many :pedidos
  belongs_to :endereco
  accepts_nested_attributes_for :endereco
  
 # scope :co_pedido, ->  User.joins(:pedido)
  
  
  
end
