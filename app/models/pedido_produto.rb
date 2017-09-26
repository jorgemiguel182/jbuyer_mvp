class PedidoProduto < ActiveRecord::Base
  belongs_to :pedido
  belongs_to :produto
  accepts_nested_attributes_for :produto
end
