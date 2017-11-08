class BackofficeController < ApplicationController
 #before_action :authenticate_admin!
  #include ActionController::HttpAuthentication::Token::ControllerMethods
  
  def pundit_user
  	current_admin  	
  end
  
  def index
     @pedido_aguardando = Pedido.where("status = 1")
     @pedido_em_atendimento = Pedido.where("status = 2")
     @pedido_finalizado_no_dia = Pedido.where("status = 3 AND pedidos.updated_at >= ?", Time.zone.now.beginning_of_day)
  end
  
  private
  def user_not_authorized
      flash[:notice] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_patch)
    end
  
   #def authenticate
   #   authenticate_or_request_with_http_token do |token, options|
   #     @user = User.find_by(token: token)
   # end
end
end
