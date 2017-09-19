class BackofficeController < ApplicationController
 before_action :authenticate_admin!
  
  
  def index
     @pedido_aguardando = User.joins(:pedido).where("status = 1")
  end
end
