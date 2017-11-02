# Preview all emails at http://localhost:3000/rails/mailers/backoffice/pedidos_mailer
class Backoffice::PedidoMailerPreview < ActionMailer::Preview
  def atualiza_pedido
    Backoffice::PedidoMailer.atualiza_pedido(User.first)
  
  end
end
