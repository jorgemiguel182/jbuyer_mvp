class Backoffice::PedidosController < BackofficeController
  before_action :set_pedido, only: [:edit, :update]
  layout "backoffice"
  
  def index    
    
  @tipo = params[:tipo] || "abertos"
       
    
  end
  
  def edit
    
  end

  def update   
   if @pedido.update(params_pedido)
      redirect_to backoffice_pedidos_path, notice: "O pedido foi alterado com sucesso"
    else 
      render :edit
    end
  end
  
  
  private
  
    def set_pedido
      @pedido = Pedido.find params[:id]
    end

    def params_pedido
       status = params[:pedido][:status]
   

      params.require(:pedido).permit(:status)
    end
 
  
  
end