class Backoffice::PedidosController < BackofficeController
  before_action :set_pedido, only: [:edit, :update, :show]
  before_action :set_user, only: [:pedido_user]
  #before_action :authenticate, only: [:create, :update]
  
  layout "backoffice"
  
  def index   
    @pedidos = Pedido.all
    render json: {pedidos: @pedidos.as_json(include: {pedido_produtos: {include: {produto: {only: [:valor_venda,:produto]}}, except: [:updated_at, :created_at]}})}
     
  end
  
  def pedido_user
    render json: {pedidos: @user}
    
  end
  
  def edit
    
  end
  
  def show
    render json: @pedido, include: {pedido_produtos: {include: {produto: {only: [:valor_pago,:produto]}}, except: [:updated_at, :created_at]}}
  end
  

  def update   
    respond_to do |format|
      if @pedido.update(params_pedido)
        Backoffice::PedidoMailer.atualiza_pedido(@pedido.user).deliver
        format.json { render json: @pedido, status: :ok }    
        format.html { redirect_to backoffice_filtrado_filtrados_abertos_path, notice: "O pedido foi alterado com sucesso"}
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
    
  def set_user
    @usersd = User.joins(:pedidos).all
    @user = @usersd.select("pedidos.*").where(:id => params[:id]).all
   # @id = params[:id]
   # @sser = Pedido.all
   # @sser = @sser.where(:user_id => @id).all
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