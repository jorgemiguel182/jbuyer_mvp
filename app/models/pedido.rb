class Pedido < ActiveRecord::Base
  has_many :produtos, through: :pedido_produtos
  has_many :pedido_produtos
  
  belongs_to :user
  #enum status: { Aberto: 1, Finalizado: 2 }
  
  scope :waiting, -> { where(status: 1) }
  
  
  scope :ok, -> { where(status: 2) }
end
