namespace :generate_tipo_produto do
  desc "TODO"
  task criar: :environment do
    puts "Cadastrando Tipos de Produtos"
    
      15.times do
        TipoProduto.create!(
          nome_tipo: Faker::Commerce.department(2, true),
          desc_tipo: Faker::Commerce.department)
       end
  end

end
