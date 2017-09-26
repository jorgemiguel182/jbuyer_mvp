class Backoffice::Filtrado::FiltradosController < BackofficeController
  before_action :authenticate_admin!
  layout "backoffice"
  layout "application", only: :detalhes
  def index  
    
    
  end
  
  def abertos 
    
    @pedido_aguardando = User.joins(:pedido).where("status = 1 OR status = 2").paginate(:page => params[:page], :per_page => 5)    
    
  end
  
  def fexados    
    @pedido_fexado = User.joins(:pedido).where("status = 3").merge(Pedido.order(updated_at: :desc)).paginate(:page => params[:page], :per_page => 5)
  end

  def show
    
  end
  
  def detalhes
    
    
    set_pedido
        
  
  end
  
   private
  
    def set_pedido
      @pedido = Pedido.find params[:id]
    end
  
  end
  
  

 
