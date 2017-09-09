namespace :generate_pedido do
  desc "Cria pedidos"
    task Pedidos: :environment do
      
      puts "Cadastrando PEDIDOS..."

        15.times do
          Produto.create!( produto: Faker::Food.dish,
            valor: Faker::Number.decimal(2),
            qtdstq: Faker::Number.number(2),
            descricao: Faker::Lorem.sentence,
            img: Faker::Company.logo
          )
        end

      puts "PEDIDOS cadastrados com sucesso!"
      
    end

end
      #pedido1 = Pedido.new(status: 1)
      #pedido1.save
      #produto1 = Produto.new(produto: "teste1",valor: "2.50")
      #produto1.save
      
      #produto1.pedido=(pedido1)
     

#produto1.pedido.status
#pedido1.produto=(produto1)