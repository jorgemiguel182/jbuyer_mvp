module Backoffice::PedidosHelper
  OptionsForStatus = Struct.new(:id, :description)

	def options_for_status
		Pedido.statuses.map do |key, value|
			OptionsForStatus.new(key, value)
	  end	
	end
	
	
	def post_date(date)
    # formatting date: Aug, 31 2007 - 9:55PM
    date.strftime("%d/%m/%Y - %H:%M")
  end
	
end
