class Pedido < ActiveRecord::Base
  has_many :produtos, through: :pedido_produtos
  has_many :pedido_produtos
  accepts_nested_attributes_for :pedido_produtos
  
  belongs_to :user
  #enum status: { Aberto: 1, Finalizado: 2 }
  
  STATUS = {:Aguardando => 1, :'Em atendimento' => 2, :Finalizado => 3}
  
  enum status: STATUS
  
  scope :waiting, -> { where(status: STATUS[:Aguardando]).or.where(status: STATUS[:'Em atendimento']) }
  
  
end
