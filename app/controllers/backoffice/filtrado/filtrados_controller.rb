class Backoffice::Filtrado::FiltradosController < ApplicationController
  layout "backoffice", except: [:detalhes]
  def index  
    
  end
  
  def abertos    
    @pedidos_aguardando = Pedido.waiting    
  end
  
  def fexados    
    @pedidos_finalizados = Pedido.ok    
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
  
  

 
