class RelatoriosController < BackofficeController
  
  def form
    
  end

  def gerar_por_periodo
    @data_ini =  DateTime.parse(params[:data_ini]).strftime("%Y-%m-%dT%l:%M:%S%z")
    @data_fin = DateTime.parse(params[:data_fin]).strftime("%Y-%m-%dT%l:%M:%S%z")
    
    
    @pedidos = Pedido.where(created_at: @data_ini..@data_fin)
    
  end
  
end
