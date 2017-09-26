class BackofficeController < ApplicationController
 before_action :authenticate_admin!
  
  def pundit_user
  	current_admin  	
  end
  
  def index
     @pedido_aguardando = User.joins(:pedido).where("status = 1")
     @pedido_em_atendimento = User.joins(:pedido).where("status = 2")
     @pedido_finalizado_no_dia = User.joins(:pedido).where("status = 3 AND pedidos.updated_at >= ?", Time.zone.now.beginning_of_day)
  end
  
  private
  def user_not_authorized
      flash[:notice] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_patch)
    end
end
