class Backoffice::PedidosController < BackofficeController
  before_action :set_pedido, only: [:edit, :update]
  layout "backoffice"
  
  def index   
    
   
    
  end
  
  def edit
    
  end

  def update   
   if @pedido.update(params_altera_status)
      redirect_to backoffice_pedidos_path, notice: "O pedido foi alterado com sucesso"
    else 
      render :edit
    end
  end
  
  def create
    @pedido = Pedido.new(params_pedido)
    
    if @pedido.save!
      respond_to do |format|
        format.json { render json: @pedido }
      end
    end
  end
    
  
  private
  
    def set_pedido
      @pedido = Pedido.find params[:id]
    end
    
    def params_altera_status
      params.require(:pedido).permit(:status)    
    end
    
    def params_pedido
      params.require(:pedido).permit(:status, :numero_nf, :total, :user_id)
    end
 
  
  
end