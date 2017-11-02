class Backoffice::PedidoMailer < ActionMailer::Base
  default from: "from@example.com"
    
  def atualiza_pedido(user)
    @user=user
    mail(to: @user.email, subject:"dados alterados")
  end
  
end
