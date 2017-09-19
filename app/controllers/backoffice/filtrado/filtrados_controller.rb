class Backoffice::Filtrado::FiltradosController < ApplicationController
  before_action :authenticate_admin!
  layout "backoffice", except: [:detalhes]
  def index  
    
  end
  
  def abertos    
    @pedido_aguardando = User.joins(:pedido).where("status = 1")
    

  end
  
  def fexados    
    @pedido_fexado = User.joins(:pedido).where("status = 2")   
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
  
  

 
