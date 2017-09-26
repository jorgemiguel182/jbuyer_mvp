class Backoffice::PedidosController < BackofficeController
  before_action :set_pedido, only: [:edit, :update, :show]
  layout "backoffice"
  
  def index   
    @pedidos = Pedido.all
    render json: @pedidos, include: {pedido_produtos: {include: {produto: {only: [:valor_pago,:produto]}}, except: [:updated_at, :created_at]}}
     
  end
  
  def edit
    
  end
  
  def show
    render json: @pedido, include: {pedido_produtos: {include: {produto: {only: [:valor_pago,:produto]}}, except: [:updated_at, :created_at]}}
  end
  

  def update   
    respond_to do |format|
      if @pedido.update(params_pedido)
        format.json { render json: @pedido, status: :ok }    
        format.html {redirect_to backoffice_filtrado_filtrados_abertos_path, notice: "O pedido foi alterado com sucesso"}
      else 
        format.html { render :edit }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  def create
    @pedido = Pedido.new(params_pedido)    
    respond_to do |format|
      if @pedido.save!
        format.json { render json: @pedido, include: {pedido_produtos: {include: {produto: {only: [:valor_pago,:produto]}}}} }
      else
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end
    
  
  private
  
    def set_pedido
      @pedido = Pedido.find params[:id]
    end
    
  
  
  def params_pedido
      params.require(:pedido).permit(
        :status, 
        :numero_nf,                     
        :total,
        :user_id,
        pedido_produtos_attributes: [
          :contador,
          :tipo_medida,
          :pedido_id,
          :produto_id,
          produtos_attributes: [
            :valor_pago,
            :produto
            ]
        ]        
        
      )    
    end
    
end