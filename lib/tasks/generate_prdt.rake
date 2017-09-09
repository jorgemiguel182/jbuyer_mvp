namespace :generate_prdt do
  desc "Cria produtos fake"
    task Produtos: :environment do
      puts "Cadastrando o PRODUTOS..."
        
        randomizado = Random.rand(10...42)
       
        
        randomizado.times do
          Produto.create!( produto: Faker::Food.dish,
            valor: Faker::Number.decimal(2)
          )
        end

      puts "PRODUTOS cadastrados com sucesso!"
    end
end