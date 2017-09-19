class TipoProduto < ActiveRecord::Base
  has_one :produto
end
