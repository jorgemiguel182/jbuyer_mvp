class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable
  #       :recoverable, :rememberable, :trackable, :validatable
   
  #has_secure_password
  
  has_many :pedidos
  belongs_to :endereco
  
  accepts_nested_attributes_for :endereco
  
 # scope :co_pedido, ->  User.joins(:pedido)
  
  
  
end
