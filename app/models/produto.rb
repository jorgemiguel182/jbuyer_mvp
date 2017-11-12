class Produto < ActiveRecord::Base
  
  belongs_to :tipo_produto 
  has_many :pedido_produtos
  has_many :pedidos, through: :pedido_produtos
  accepts_nested_attributes_for :tipo_produto
  
  has_attached_file :foto, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :foto, content_type: /\Aimage\/.*\z/
end
