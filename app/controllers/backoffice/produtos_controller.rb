class Backoffice::ProdutosController < BackofficeController
  before_action :set_produto, only: [:show]

  
  def index
    @produtos = Produto.all
        
    render json: {produtos: @produtos}    
  end
  
  
  def show
    render json: @produto, except: [:created_at, :updated_at, :valor_pago]
  end
  
  
  private
  
    def set_produto
      @produto = Produto.find params[:id]
    end 
  
  
  

end
