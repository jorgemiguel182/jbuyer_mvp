class Pedido < ActiveRecord::Base
  has_many :produtos
  #enum status: { Aberto: 1, Finalizado: 2 }
  
  scope :waiting, -> { where(status: 1) }
  
  scope :ok, -> { where(status: 2) }
end
