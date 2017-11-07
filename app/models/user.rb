class User < ActiveRecord::Base
  before_create -> {self.token = generate_token}
  
  has_many :pedidos
  belongs_to :endereco
  
  accepts_nested_attributes_for :endereco
  
 # scope :co_pedido, ->  User.joins(:pedido)
  
  private
 
  def generate_token
      loop do
        token = SecureRandom.hex
        return token unless User.exists?({token: token})
      end
  end
  
  
end
