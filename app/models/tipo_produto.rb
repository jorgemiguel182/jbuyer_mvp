class TipoProduto < ActiveRecord::Base
  has_one :produto
  accepts_nested_attributes_for :produto
end
