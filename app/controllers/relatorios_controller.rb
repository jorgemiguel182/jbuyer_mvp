class RelatoriosController < BackofficeController
  
  def form
    
  end

  def gerar_por_periodo
    @data_ini =  DateTime.parse(params[:data_ini]).strftime("%Y-%m-%dT%l:%M:%S%z")
    @data_fin = DateTime.parse(params[:data_fin]).strftime("%Y-%m-%dT%l:%M:%S%z")
    
    
    @pedidos = Pedido.where(created_at: @data_ini..@data_fin, status: 3)
    
    respond_to do |format|
      format.html
      format.pdf do
       render pdf: "file_name_of_your_choice",
               template: "relatorios/gerar_por_periodo.pdf.erb",
               orientation:                    'Portrait', #Landscape
               locals: {:invoice => @invoice}
      end
    end
    
  end
    

  
end
