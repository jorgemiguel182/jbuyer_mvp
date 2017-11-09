class Backoffice::ProdutosController < BackofficeController
  before_action :set_produto, only: [:show, :edit]

  
  def index
    @produtos = Produto.all.paginate(:page => params[:page], :per_page => 5)
    
    respond_to do |format|
      format.html
      format.json { render json: {produtos: @produtos} }
    end
  end
  
  def new
    @produto = Produto.new
  end
  
  
  def show
    render json: @produto, except: [:created_at, :updated_at, :valor_pago]
  end
  
  
  def create
    @produto = Produto.new(params_prod)
    if @produto.save
      redirect_to backoffice_produtos_path, notice: "O produto (#{@produto.produto}) foi cadastrado com sucesso!"
    else 
      render :new
    end
  end
  
  def edit
  
  end

  def update
    if @produto.update(params_prod)      
      redirect_to :index, notice: "O produto (#{@produto.produto}) foi cadastrado com sucesso!"
    else 
      render :edit
    end
  end
  
  
  
  private
  
    def set_produto
      @produto = Produto.find params[:id]
    end 
    
    def params_prod   
      params.require(:produto).permit(:produto, 
        :desc_produto, 
        :qtd_estoque, 
        :valor_pago, 
        :valor_venda, 
        tipo_produto_attributes: [
          :nome_tipo
          ])
    end

end
